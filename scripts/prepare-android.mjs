import {cp,mkdir,rm,readFile,writeFile} from 'node:fs/promises';
import {fileURLToPath} from 'node:url';
import path from 'node:path';
const root=fileURLToPath(new URL('../',import.meta.url));
const output=path.join(root,'android/app/src/main/assets/web');
// Fixed generated directory within android/app/src/main/assets only.
await rm(output,{recursive:true,force:true});await mkdir(output,{recursive:true});
await cp(path.join(root,'public'),output,{recursive:true,filter:source=>{
  const relative=path.relative(path.join(root,'public'),source).replaceAll('\\','/');
  return !/^(game\/(assist|relaxed)|downloads)(\/|$)/.test(relative);
}});
await cp(path.join(root,'vendor/ruffle-0.7.1'),path.join(output,'ruffle'),{recursive:true,filter:source=>!source.endsWith('.map')});
const index=path.join(output,'index.html');
let html=await readFile(index,'utf8');
html=html.replace(/<option value="assist">[^<]*<\/option>/,'').replace(/<option value="relaxed">[^<]*<\/option>/,'');
html=html.replace('灵动嘻哈外传 · 本地版','灵动嘻哈外传 · 离线版');
await writeFile(index,html);
// Use the established WebGL renderer instead of wgpu's WebGL backend on mobile.
const app=path.join(output,'app.js');
await writeFile(app,(await readFile(app,'utf8')).replace("splashScreen: false, contextMenu: 'on'","splashScreen: false, contextMenu: 'on', preferredRenderer: 'webgl'"));
console.log('Prepared offline Android assets: latest combat + original.');
