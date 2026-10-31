import { test } from 'node:test';
import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import { createHash } from 'node:crypto';
import { decodeSwf, readTags, readActions } from '../scripts/swf-tools.mjs';
import { costAssignments, recognizers } from '../scripts/patch-specials.mjs';
const root = new URL('../',import.meta.url);
const sha = b=>createHash('sha256').update(b).digest('hex');
test('direction assist modifies only recognizers and five small-special costs',async()=>{
  const manifest = JSON.parse(await readFile(new URL('public/game/assist/patch-manifest.json',root)));
  assert.equal(manifest.files.length,4);
  for (const entry of manifest.files) {
    const a=await readFile(new URL(`public/game/${entry.path}`,root));
    const b=await readFile(new URL(`public/game/assist/${entry.path}`,root));
    assert.equal(sha(a),entry.original_sha256); assert.equal(sha(b),entry.patched_sha256);
    const original=decodeSwf(a), patched=decodeSwf(b);
    assert.deepEqual(original.body.subarray(0,original.start),patched.body.subarray(0,patched.start));
    const before=readTags(original.body,original.start),after=readTags(patched.body,patched.start);
    assert.equal(before.length,after.length);
    let changed=0;
    for(let i=0;i<before.length;i++){
      const old=before[i],next=after[i]; assert.equal(old.code,next.code);
      if(old.data.equals(next.data))continue;
      changed++;
      if(entry.id===0){
        assert.equal(old.code,12);
        const costs=Object.fromEntries(costAssignments(next.data).map(x=>[x.key,x.value]));
        assert.deepEqual(costs,{b_cz:0,b_fk:0,b_gt1:0,b_gt2:0,b_gt3:0,b_lc:100,b_lw:130});
        assert.equal(old.data.length,next.data.length);
        const diffs=[];for(let j=0;j<old.data.length;j++)if(old.data[j]!==next.data[j])diffs.push(j);
        assert.equal(diffs.length,5);
        for(const j of diffs){assert.ok([5,10].includes(old.data[j]));assert.equal(next.data[j],0);}
      }else{
        assert.equal(old.code,39);
        const sprite=old.data.readUInt16LE(0);assert.ok(recognizers[entry.id].includes(sprite));
        const frames=old.data.readUInt16LE(2);assert.equal(next.data.readUInt16LE(2),frames*2);
        const oldTags=readTags(old.data,4),newTags=readTags(next.data,4);
        assert.equal(newTags.filter(x=>x.code===1).length,frames*2);
        // Shapes, placements, removals and labels remain identical and occur once.
        assert.deepEqual(oldTags.filter(x=>![1,12].includes(x.code)),newTags.filter(x=>![1,12].includes(x.code)));
        const labels=tags=>{
          let frame=0;const entries=[];
          for(const tag of tags){if(tag.code===43)entries.push([tag.data.toString('hex'),frame]);if(tag.code===1)frame++;}
          return entries;
        };
        assert.deepEqual(labels(newTags),labels(oldTags).map(([label,frame])=>[label,frame*2]));
        const actionFrames=tags=>{
          const frames=[];let current=[];
          for(const tag of tags){if(tag.code===12)current.push(tag);if(tag.code===1){frames.push(current);current=[];}}
          return frames;
        };
        const oldFrames=actionFrames(oldTags),newFrames=actionFrames(newTags);
        for(let frame=0;frame<oldFrames.length;frame++){
          const jumps=tags=>tags.flatMap(x=>readActions(x.data)).filter(x=>x.code===0x81).map(x=>x.data.readUInt16LE(0));
          const expected=jumps(oldFrames[frame]).map(x=>x*2);
          assert.deepEqual(jumps(newFrames[frame*2]),expected);
          assert.deepEqual(jumps(newFrames[frame*2+1]),expected);
        }
        for(const action of newTags.filter(x=>x.code===12).flatMap(x=>readActions(x.data)))
          if(action.code===0x81){const target=action.data.readUInt16LE(0);assert.equal(target%2,0);assert.ok(target<frames*2);}
      }
    }
    assert.equal(changed,entry.id?6:1);
  }
});
