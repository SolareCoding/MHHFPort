import {test} from 'node:test';
import assert from 'node:assert/strict';
import vm from 'node:vm';
import {readFile} from 'node:fs/promises';
import {createHash} from 'node:crypto';
import {decodeSwf,readTags} from '../scripts/swf-tools.mjs';
import {namedPlacement,playerBoxes} from '../scripts/player-hitboxes.mjs';
import {costAssignments} from '../scripts/patch-specials.mjs';
const source=await readFile(new URL('../scripts/combat-command-assist.as',import.meta.url),'utf8');
function harness(mp=130){
  let now=0,keys=new Set();const casts=[];
  const root={pause:0,hp:100,mp,b_fk:0,b_gt1:0,b_lc:100,b_lw:130,dong:0,down:83,up:87,left:65,right:68,atk:74,keyBack(){}};
  const actor={inair:false,_currentframe:2,onEnterFrame(){},gotoAndPlay(name){casts.push(name);}};
  vm.runInNewContext(source,Object.assign(actor,{_root:root,Key:{isDown:key=>keys.has(key)},getTimer:()=>now,trace(){}}));
  return {casts,root,actor,step(ms,pressed){now=ms;keys=new Set(pressed);actor.onEnterFrame();}};
}
test('DDU accepts separated down taps, a diagonal up and delayed attack',()=>{
  const h=harness();h.step(0,[83]);h.step(80,[]);h.step(450,[83]);h.step(500,[]);h.step(1000,[87,68]);h.step(1100,[]);h.step(1400,[74]);
  assert.deepEqual(h.casts,['龙出前']);h.step(1440,[74]);assert.equal(h.casts.length,1);
});
test('four direct skills start only once and preserve ground and MP gates',()=>{
  for(const [key,name] of [[49,'飞空'],[50,'鬼步1'],[51,'龙出前'],[52,'乱舞前']]){
    const h=harness();h.step(0,[key]);h.step(40,[key]);assert.deepEqual(h.casts,[name]);
  }
  const low=harness(0);low.step(0,[51]);low.step(100,[52]);assert.equal(low.casts.length,0);
  const air=harness();air.actor.inair=true;air.step(0,[49]);assert.equal(air.casts.length,0);
  const busy=harness();busy.actor._currentframe=197;busy.step(0,[50]);assert.equal(busy.casts.length,0,'third stage is not auto-triggered');
});
test('repeat skill taps buffer their next stage without skipping the opener hit',()=>{
  for(const [key,opening,next,early,ready] of [[49,'飞空','飞空2',112,119],[50,'鬼步1','鬼步2',183,188]]){
    const h=harness();h.step(0,[key]);h.actor._currentframe=early;h.step(40,[]);h.step(80,[key]);
    assert.deepEqual(h.casts,[opening]);h.step(120,[key]);assert.equal(h.casts.length,1);
    h.actor._currentframe=ready;h.step(320,[]);assert.deepEqual(h.casts,[opening,next]);
    h.actor._currentframe=next==='飞空2'?142:197;h.step(360,[key]);assert.equal(h.casts.length,2);
  }
  const h=harness();h.actor._currentframe=112;h.step(0,[49]);h.root.pause=1;h.step(40,[]);h.root.pause=0;h.actor._currentframe=119;h.step(200,[]);assert.equal(h.casts.length,0,'pause cancels pending stage');
});
test('three distinct ghost taps advance 1 to 2 to 3, holding never auto-advances',()=>{
  const h=harness();h.step(0,[50]);h.actor._currentframe=183;h.step(40,[]);h.step(80,[50]);
  h.actor._currentframe=188;h.step(320,[50]);assert.deepEqual(h.casts,['鬼步1','鬼步2']);
  h.actor._currentframe=203;h.step(640,[50]);assert.equal(h.casts.length,2);
  h.step(680,[]);h.step(720,[50]);assert.deepEqual(h.casts,['鬼步1','鬼步2','鬼步3']);
  h.actor._currentframe=214;h.step(760,[50]);h.step(800,[]);h.step(840,[50]);assert.equal(h.casts.length,3);
});
test('double quarter-circle accepts diagonals and delayed attack on either side',()=>{
  for(const side of [65,68]){const h=harness();h.step(0,[83]);h.step(80,[83,side]);h.step(220,[side]);h.step(600,[83,side]);h.step(720,[83]);h.step(950,[83,side]);h.step(1100,[side]);h.step(1500,[74]);assert.deepEqual(h.casts,['乱舞前']);}
});
test('armed ultimate survives the original child consuming this same J first',()=>{
  const prepare=()=>{const h=harness();h.step(0,[83]);h.step(80,[]);h.step(200,[83]);h.step(300,[]);h.step(450,[87]);h.step(500,[]);return h;};
  const h=prepare();h.actor._currentframe=14;h.root.dong=1;h.step(650,[74]);assert.deepEqual(h.casts,['龙出前']);
  const hurt=prepare();hurt.actor._currentframe=462;hurt.step(650,[74]);assert.equal(hurt.casts.length,0);
});
test('timeouts, insufficient MP, pause and held-down cannot bypass command gates',()=>{
  for(const scenario of ['expired','low-mp','pause','held-down','no-attack']){
    const h=harness(scenario==='low-mp'?99:130);h.step(0,[83]);h.step(80,scenario==='held-down'?[83]:[]);h.step(250,[83]);h.step(300,[]);
    if(scenario==='pause'){h.root.pause=1;h.step(350,[]);h.root.pause=0;}
    h.step(500,[87]);h.step(550,[]);h.step(scenario==='expired'?1200:700,scenario==='no-attack'?[]:[74]);assert.equal(h.casts.length,0,scenario);
  }
  const h=harness(100);h.step(0,[83]);h.step(100,[68]);h.step(200,[83]);h.step(300,[68]);h.step(400,[74]);assert.equal(h.casts.length,0,'130 MP cost preserved');
});
test('all three player variants preserve non-hitbox root tags and exact helper bytecode',async()=>{
  const root=new URL('../public/game/',import.meta.url),manifest=JSON.parse(await readFile(new URL('combat/patch-manifest.json',root)));
  for(const entry of manifest.files.filter(x=>x.id)){
    const original=decodeSwf(await readFile(new URL('assist/'+entry.path,root)));
    const patchedBytes=await readFile(new URL('combat/'+entry.path,root));
    assert.equal(createHash('sha256').update(patchedBytes).digest('hex'),entry.patched_sha256);
    const patched=decodeSwf(patchedBytes),a=readTags(original.body,original.start),b=readTags(patched.body,patched.start);
    assert.equal(b.length,a.length+1);
    let firstFrame=a.findIndex(t=>t.code===1);
    assert.equal(b[firstFrame].code,12);
    assert.equal(b[firstFrame].data.includes(Buffer.from('combat CAST')),false,'temporary verification probe removed');
    const helper=entry.changes.find(x=>x.feature==='ultimate-history');
    assert.equal(createHash('sha256').update(b[firstFrame].data).digest('hex'),helper.helper_sha256);
    b.splice(firstFrame,1);let count=0;
    for(let i=0;i<a.length;i++){
      assert.equal(a[i].code,b[i].code);
      const before=a[i].code===26?namedPlacement(a[i].data):null;
      if(before&&playerBoxes.has(before.name)){
        const after=namedPlacement(b[i].data);assert.equal(after.name,before.name);
        assert.ok(Math.abs(after.matrix.sx-before.matrix.sx*1.25)<=.5);
        assert.ok(Math.abs(after.matrix.sy-before.matrix.sy*1.15)<=.5);
        assert.equal(after.matrix.ty,before.matrix.ty);
        assert.equal(after.matrix.tx,Math.round(before.matrix.tx+(before.matrix.sx/65536)*2.5));count++;
      }else assert.deepEqual(a[i].data,b[i].data);
    }
    assert.equal(count,entry.id===3?15:14);
  }
});
test('MP import changes only audited enemy sprites and preserves all big-skill prices',async()=>{
  const root=new URL('../public/game/',import.meta.url);
  const aSwf=decodeSwf(await readFile(new URL('assist/a5b.swf',root))),bSwf=decodeSwf(await readFile(new URL('combat/a5b.swf',root)));
  const a=readTags(aSwf.body,aSwf.start),b=readTags(bSwf.body,bSwf.start);assert.equal(a.length,b.length);
  const permitted=new Set([113,190,260,319,368,456,591,675,748,793,910,1034,1112,1325,1381,1458,1513]);let changed=0;
  for(let i=0;i<a.length;i++){
    assert.equal(a[i].code,b[i].code);
    if(!a[i].data.equals(b[i].data)){assert.equal(a[i].code,39);assert.ok(permitted.has(a[i].data.readUInt16LE(0)));changed++;}
  }
  assert.equal(changed,permitted.size);
  const costs=b.filter(x=>x.code===12).flatMap(x=>costAssignments(x.data));
  assert.equal(costs.find(x=>x.key==='b_lc').value,100);assert.equal(costs.find(x=>x.key==='b_lw').value,130);
});
