"""Static SWF container inventory. Does not execute ActionScript."""
import collections
import hashlib
import json
import pathlib
import struct
import zlib

BASE = pathlib.Path(__file__).resolve().parent
NAMES = {0:'End',1:'ShowFrame',2:'DefineShape',7:'DefineButton',10:'DefineFont',
    12:'DoAction',14:'DefineSound',18:'SoundStreamHead',19:'SoundStreamBlock',
    20:'DefineBitsLossless',21:'DefineBitsJPEG2',22:'DefineShape2',26:'PlaceObject2',
    32:'DefineShape3',33:'DefineText2',34:'DefineButton2',35:'DefineBitsJPEG3',
    36:'DefineBitsLossless2',37:'DefineEditText',39:'DefineSprite',43:'FrameLabel',
    45:'SoundStreamHead2',46:'DefineMorphShape',48:'DefineFont2',56:'ExportAssets',
    57:'ImportAssets',59:'DoInitAction',69:'FileAttributes',70:'PlaceObject3',
    71:'ImportAssets2',75:'DefineFont3',76:'SymbolClass',82:'DoABC',83:'DefineShape4',
    84:'DefineMorphShape2',87:'DefineBinaryData'}

def inspect(path):
    raw = path.read_bytes()
    signature = raw[:3].decode('ascii')
    declared = struct.unpack_from('<I',raw,4)[0]
    if signature == 'CWS':
        body=zlib.decompress(raw[8:])
    elif signature == 'FWS':
        body=raw[8:]
    else:
        raise ValueError(signature)
    assert len(body)+8 == declared
    bits=''.join(f'{b:08b}' for b in body[:18])
    n=int(bits[:5],2)
    coords=[]
    for i in range(4):
        value=int(bits[5+i*n:5+(i+1)*n],2)
        if value & (1 << (n-1)): value-=1 << n
        coords.append(value)
    rectlen=(5+4*n+7)//8
    fps,frames=struct.unpack_from('<HH',body,rectlen)
    counts=collections.Counter()
    sprites=[]
    labels=[]
    exports=[]
    def tags(data,start,owner):
        p=start
        frame=1
        children=collections.Counter()
        local_labels=[]
        action_count=0
        ended=False
        while p < len(data):
            assert p+2 <= len(data)
            h=struct.unpack_from('<H',data,p)[0];p+=2
            code,length=h>>6,h&63
            if length==63:
                assert p+4 <= len(data)
                length=struct.unpack_from('<I',data,p)[0];p+=4
            assert p+length <= len(data)
            payload=data[p:p+length];p+=length
            counts[code]+=1
            if code==39:
                sid,nframes=struct.unpack_from('<HH',payload)
                detail=tags(payload,4,sid)
                sprites.append(dict(id=sid,declared_frames=nframes,**detail))
            elif code==43:
                label=payload.split(b'\0',1)[0].decode('utf-8',errors='replace')
                local_labels.append(dict(frame=frame,label=label))
                labels.append(dict(owner=owner,frame=frame,label=label))
            elif code==56:
                num=struct.unpack_from('<H',payload)[0];pos=2
                for _ in range(num):
                    cid=struct.unpack_from('<H',payload,pos)[0];pos+=2
                    end=payload.index(0,pos)
                    name=payload[pos:end].decode('utf-8',errors='replace');pos=end+1
                    exports.append(dict(id=cid,name=name))
            elif code==26 and payload[0]&2:
                cid=struct.unpack_from('<H',payload,3)[0]
                children[cid]+=1
            if code in (12,59): action_count+=1
            if code==1: frame+=1
            if code==0: ended=True;break
        assert ended
        return dict(frame_labels=local_labels,placed_character_counts=dict(children),
                    timeline_action_tags=action_count,show_frame_tags=frame-1)
    root=tags(body,rectlen+4,'root')
    return dict(file=str(path.relative_to(BASE.parent)),sha256=hashlib.sha256(raw).hexdigest(),
        compressed_bytes=len(raw),uncompressed_bytes=declared,signature=signature,
        swf_version=raw[3],frame_rate=fps/256,stage_pixels=dict(width=(coords[1]-coords[0])/20,
        height=(coords[3]-coords[2])/20),root_frames=frames,root=root,
        tag_counts={NAMES.get(k,str(k)):v for k,v in sorted(counts.items())},
        sprite_count=len(sprites),sprites=sorted(sprites,key=lambda s:s['id']),
        frame_labels=labels,exports=exports,
        verification='Decompressed length and recursively visited tag bounds/End tags verified; static only')

paths=[BASE.parent/'lingdong-hiphop-integrated.swf',*(BASE/'dependencies').glob('*.swf')]
results=[inspect(p) for p in paths]
(BASE/'swf-inventory.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
for r in results:
    print(json.dumps({k:v for k,v in r.items() if k not in ('sprites','frame_labels','exports','root')},ensure_ascii=False))
