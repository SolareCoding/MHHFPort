import { readFile, writeFile, mkdir, readdir, mkdtemp, stat } from 'node:fs/promises';
import { execFile } from 'node:child_process';
import { promisify } from 'node:util';
import path from 'node:path';
import os from 'node:os';
import { fileURLToPath } from 'node:url';

const exec = promisify(execFile);
const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const sources = path.join(root, 'archive/lingdong-hiphop/analysis-integrated/export/scripts');
export const eligibleBoxes = ['h1','h2','h3','ts','ts1','b_cj','b_fk','b_fk3','b_gb1','b_gb2','b_gb3'];
export const mpRestoreStatement = '_root.mp = Math.min(_root.maxmp,_root.mp + 5);';

export function transformEnemyScript(source) {
  const pattern = /if\s*\(\s*hitTest\s*\(\s*man\.(h[123]|ts1?|b_cj|b_fk3?|b_gb[123])\s*\)\s*\)\s*\{/g;
  const edits = [];
  let match, checked = 0, blocked = 0, replacedExisting = 0;
  while ((match = pattern.exec(source))) {
    checked++;
    const open = pattern.lastIndex - 1;
    let depth = 1, end = open + 1;
    while (end < source.length && depth) {
      if (source[end] === '{') depth++;
      if (source[end] === '}') depth--;
      end++;
    }
    if (depth) throw new Error('Unbalanced enemy collision block');
    let block = source.slice(open + 1, end - 1);
    const damage = [...block.matchAll(/_parent\.hp\s*-=\s*[^;]+;/g)];
    if (!damage.length) { blocked++; continue; }
    if (damage.length !== 1) throw new Error('Ambiguous accepted-hit branch');
    const oldRestore = [...block.matchAll(/_root\.mp\s*\+=\s*1\s*;/g)];
    if (oldRestore.length > 1) throw new Error('Multiple legacy restores in one branch');
    replacedExisting += oldRestore.length;
    block = block.replace(/^[ \t]*_root\.mp\s*\+=\s*1\s*;\r?\n/gm, '');
    if (/_root\.mp\s*[+=]/.test(block)) throw new Error('Unexpected existing MP mutation');
    block = block.replace(/(_parent\.hp\s*-=\s*[^;]+;)/, `$1\n      ${mpRestoreStatement}`);
    edits.push({ start: open + 1, end: end - 1, block, box: match[1] });
  }
  if (checked !== eligibleBoxes.length) throw new Error(`Expected 11 player-hit branches, found ${checked}`);
  let text = source;
  for (const edit of [...edits].reverse()) text = text.slice(0,edit.start) + edit.block + text.slice(edit.end);
  return { text, checked, blocked, restoredBranches:edits.length, replacedExisting,
    boxes:edits.map(x=>x.box) };
}

async function collisionPaths() {
  const paths = [];
  for (const entry of await readdir(sources,{withFileTypes:true})) {
    if (!entry.isDirectory() || !/^DefineSprite_\d+_e_/.test(entry.name)) continue;
    const base = path.join(sources,entry.name);
    async function walk(directory) {
      for (const item of await readdir(directory,{withFileTypes:true})) {
        const full = path.join(directory,item.name);
        if(item.isDirectory())await walk(full);
        else if(item.name==='CLIPACTIONRECORD onClipEvent(enterFrame).as') {
          const text = await readFile(full,'utf8');
          if(/hitTest\(man\.h1\)/.test(text)) paths.push({ relative:path.relative(sources,full),text });
        }
      }
    }
    await walk(base);
  }
  return paths.sort((a,b)=>a.relative.localeCompare(b.relative));
}

export async function patchHitMp(inputPath, outputPath, {javaPath,ffdecPath}={}) {
  const java = javaPath || process.env.JAVA_PATH || (process.env.JAVA_HOME && path.join(process.env.JAVA_HOME,'bin',process.platform==='win32'?'java.exe':'java')) || path.join(os.homedir(),'.jdks/corretto-17.0.15/bin/java.exe');
  const ffdec = ffdecPath || process.env.FFDEC_JAR || path.join(root,'archive/lingdong-hiphop/tools/ffdec-26.4.0/ffdec.jar');
  await stat(java); await stat(ffdec); await stat(inputPath);
  const temp = await mkdtemp(path.join(os.tmpdir(),'mhhf-hit-mp-'));
  const imports = path.join(temp,'scripts');
  await mkdir(imports,{recursive:true});
  // These separate collision clips initiate the player's automatic grab.
  const grabFiles=[];
  async function disableGrabs(directory) {
    for(const item of await readdir(directory,{withFileTypes:true})) {
      const full=path.join(directory,item.name);
      if(item.isDirectory())await disableGrabs(full);
      else if(item.name.endsWith('.as')) {
        const text=await readFile(full,'utf8');
        if(!text.includes('man.gotoAndPlay("抓人")'))continue;
        if(!text.includes('if(hitTest(_parent._parent.man.zhua))'))throw new Error('Unexpected grab condition');
        const relative=path.relative(sources,full),dest=path.join(imports,relative);
        await mkdir(path.dirname(dest),{recursive:true});
        await writeFile(dest,'onClipEvent(enterFrame){ /* Proximity auto-grab disabled. */ }\n');
        grabFiles.push(relative);
      }
    }
  }
  await disableGrabs(sources);
  if(grabFiles.length!==18)throw new Error('Unexpected auto-grab inventory: '+grabFiles.length);
  const entries = await collisionPaths();
  if(entries.length!==21)throw new Error(`Expected 21 enemy collision scripts, found ${entries.length}`);
  const summary = { checkedScripts:21,modifiedScripts:0,restoredBranches:0,blockedBranches:0,replacedExisting:0,tempDirectory:temp,files:[] };
  for(const entry of entries) {
    const transformed = transformEnemyScript(entry.text);
    summary.blockedBranches += transformed.blocked;
    if(!transformed.restoredBranches)continue;
    const dest = path.join(imports,entry.relative);
    await mkdir(path.dirname(dest),{recursive:true});
    await writeFile(dest,transformed.text);
    summary.modifiedScripts++; summary.restoredBranches += transformed.restoredBranches;
    summary.replacedExisting += transformed.replacedExisting;
    summary.files.push({path:entry.relative.replaceAll('\\','/'),branches:transformed.restoredBranches});
  }
  if(summary.modifiedScripts!==20 || summary.restoredBranches!==220 || summary.blockedBranches!==11)
    throw new Error(`Unexpected enemy branch inventory: ${JSON.stringify(summary)}`);
  await mkdir(path.dirname(path.resolve(outputPath)),{recursive:true});
  const before=await readFile(inputPath);
  const result = await exec(java,['-Xmx1024m','-jar',ffdec,'-onerror','abort','-importScript',path.resolve(inputPath),path.resolve(outputPath),imports],{windowsHide:true,maxBuffer:8*1024*1024,timeout:120000});
  await writeFile(path.join(temp,'import.log'),result.stdout+'\n'+result.stderr);
  const after=await readFile(outputPath);
  if(before.equals(after))throw new Error(`FFDec did not change the file; inspect ${temp}`);
  // Import success alone is not evidence that FFDec found/compiled every path.
  // Independently decompile the resulting SWF and count the generated statements.
  const verified = path.join(temp,'verified');
  const exported = await exec(java,['-Xmx1024m','-jar',ffdec,'-export','script',verified,path.resolve(outputPath)],{windowsHide:true,maxBuffer:8*1024*1024,timeout:120000});
  await writeFile(path.join(temp,'verify-export.log'),exported.stdout+'\n'+exported.stderr);
  let verifiedBranches=0;
  for(const file of summary.files) {
    const text=await readFile(path.join(verified,'scripts',file.path),'utf8');
    const count=text.split(mpRestoreStatement).length-1;
    if(count!==file.branches || /_root\.mp\s*\+=\s*1\s*;/.test(text))throw new Error(`MP compile verification failed: ${file.path}`);
    verifiedBranches+=count;
  }
  const shield=await readFile(path.join(verified,'scripts','DefineSprite_675_e_03boss/frame_79/PlaceObject2_23_11/CLIPACTIONRECORD onClipEvent(enterFrame).as'),'utf8');
  if(shield.includes(mpRestoreStatement))throw new Error('Boss shield unexpectedly restores MP');
  summary.verifiedBranches=verifiedBranches;
  for(const relative of grabFiles) {
    // FFDec may omit an entirely empty event from its script export.
    const text=await readFile(path.join(verified,'scripts',relative),'utf8').catch(error=>{if(error.code==='ENOENT')return '';throw error;});
    if(/抓人|被抓|Throw|man\.zhua/.test(text))throw new Error('Auto-grab remained: '+relative);
  }
  summary.disabledAutoGrabs=grabFiles.length;
  if(verifiedBranches!==220)throw new Error('Incomplete independently verified MP patch');
  return summary;
}
