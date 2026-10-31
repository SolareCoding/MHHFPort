import {readFile,writeFile,mkdir,mkdtemp} from 'node:fs/promises';
import {tmpdir,homedir} from 'node:os';
import path from 'node:path';
import {fileURLToPath} from 'node:url';
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
import {decodeSwf,encodeSwf,readTags,writeTag} from './swf-tools.mjs';
import {expandPlayerBox} from './player-hitboxes.mjs';
import {patchHitMp} from './patch-hit-mp.mjs';
const root=fileURLToPath(new URL('../',import.meta.url));
const java=process.env.JAVA_COMMAND||path.join(homedir(),'.jdks/corretto-17.0.15/bin/java'+(process.platform==='win32'?'.exe':''));
const ffdec=path.join(root,'archive/lingdong-hiphop/tools/ffdec-26.4.0/ffdec.jar');
const temp=await mkdtemp(path.join(tmpdir(),'mhhf-combat-'));
const helperFile=path.join(temp,'helper.bin');
execFileSync(java,['-cp',ffdec,path.join(root,'scripts/CompileAvm1.java'),path.join(root,'scripts/combat-command-assist.as'),helperFile],{windowsHide:true});
const helper=await readFile(helperFile);
const healFile=path.join(temp,'heal.bin');
execFileSync(java,['-cp',ffdec,path.join(root,'scripts/CompileAvm1.java'),path.join(root,'scripts/ultimate-heal.as'),healFile],{windowsHide:true});
const heal=await readFile(healFile);
const base=JSON.parse(await readFile(path.join(root,'public/game/assist/patch-manifest.json')));
const output=path.join(root,'public/game/combat');
await mkdir(path.join(output,'games/data/mhhf_w'),{recursive:true});
const sha=b=>createHash('sha256').update(b).digest('hex'),files=[];
for(const file of base.files){
  const sourcePath=path.join(root,'public/game/assist',file.path),source=await readFile(sourcePath);
  if(sha(source)!==file.patched_sha256)throw new Error('Base assist hash mismatch');
  const destination=path.join(output,file.path);
  const changes=[];
  if(file.id===0){
    const summary=await patchHitMp(sourcePath,destination,{javaPath:java,ffdecPath:ffdec});
    changes.push({feature:'hit-mp',modifiedScripts:summary.modifiedScripts,verifiedBranches:summary.verifiedBranches});
    changes.push({feature:'no-auto-grab',disabledClips:summary.disabledAutoGrabs});
  }else{
    const swf=decodeSwf(source),tags=[];let injected=false,frame=1;
    for(const tag of readTags(swf.body,swf.start)){
      if(tag.code===1&&!injected){tags.push({code:12,data:helper});injected=true;}
      if(tag.code===1&&[342,355].includes(frame))tags.push({code:12,data:heal});
      const expanded=tag.code===26?expandPlayerBox(tag.data):null;
      if(expanded){tags.push({...tag,data:expanded.data});changes.push({feature:'hitbox',name:expanded.name,before:expanded.before,after:expanded.after});}
      else tags.push(tag);
      if(tag.code===1)frame++;
    }
    if(!injected||changes.length!==(file.id===3?15:14))throw new Error('Unexpected character patch count');
    await writeFile(destination,encodeSwf(swf.header,Buffer.concat([swf.body.subarray(0,swf.start),...tags.map(writeTag)])));
    changes.push({feature:'ultimate-history',directionGapMs:750,attackGraceMs:450,helper_sha256:sha(helper)});
    changes.push({feature:'ultimate-heal',frames:[342,355],maxHpFraction:0.15,heal_sha256:sha(heal)});
  }
  const patched=await readFile(destination);files.push({id:file.id,path:file.path,base_sha256:sha(source),patched_sha256:sha(patched),changes});
}
await writeFile(path.join(output,'patch-manifest.json'),JSON.stringify({version:3,description:'Combat v3: floating controls, no proximity grabs, 15% HP restoration on ultimate cast; based on directional assist',files},null,2)+'\n');
console.log('Generated combat assist v3.');
