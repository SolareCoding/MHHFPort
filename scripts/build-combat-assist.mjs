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
  }else{
    const swf=decodeSwf(source),tags=[];let injected=false;
    for(const tag of readTags(swf.body,swf.start)){
      if(tag.code===1&&!injected){tags.push({code:12,data:helper});injected=true;}
      const expanded=tag.code===26?expandPlayerBox(tag.data):null;
      if(expanded){tags.push({...tag,data:expanded.data});changes.push({feature:'hitbox',name:expanded.name,before:expanded.before,after:expanded.after});}
      else tags.push(tag);
    }
    if(!injected||changes.length!==(file.id===3?15:14))throw new Error('Unexpected character patch count');
    await writeFile(destination,encodeSwf(swf.header,Buffer.concat([swf.body.subarray(0,swf.start),...tags.map(writeTag)])));
    changes.push({feature:'ultimate-history',directionGapMs:750,attackGraceMs:450,helper_sha256:sha(helper)});
  }
  const patched=await readFile(destination);files.push({id:file.id,path:file.path,base_sha256:sha(source),patched_sha256:sha(patched),changes});
}
await writeFile(path.join(output,'patch-manifest.json'),JSON.stringify({version:2,description:'Ultimate input history, capped hit MP recovery, player-only expanded hitboxes; based on directional assist',files},null,2)+'\n');
console.log('Generated combat assist v2.');
