import { test } from 'node:test';
import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { transformEnemyScript,mpRestoreStatement } from '../scripts/patch-hit-mp.mjs';
const sources=fileURLToPath(new URL('../archive/lingdong-hiphop/analysis-integrated/export/scripts/',import.meta.url));
const fixture='DefineSprite_113_e_01/frame_2/PlaceObject2_23_8/CLIPACTIONRECORD onClipEvent(enterFrame).as';
test('only accepted ordinary and small-special hits regenerate capped MP',async()=>{
  const source=await readFile(path.join(sources,fixture),'utf8');
  const transformed=transformEnemyScript(source);
  assert.equal(transformed.restoredBranches,11);
  assert.equal(transformed.replacedExisting,5);
  assert.equal(transformed.text.split(mpRestoreStatement).length-1,11);
  assert.doesNotMatch(transformed.text,/_root\.mp\s*\+=\s*1/);
  for(const excluded of ['man.b_fire','man.b_cbs2','long.b_lc','_parent._parent.Throw.thro']){
    const begin=source.indexOf(`if(hitTest(${excluded}))`);
    assert.ok(begin>=0,excluded);
    const next=source.indexOf('\n   if(',begin+1);
    const block=source.slice(begin,next<0?source.length:next);
    assert.ok(transformed.text.includes(block),`Excluded block changed: ${excluded}`);
  }
});
test('boss shield contacts give no MP',async()=>{
  const source=await readFile(path.join(sources,'DefineSprite_675_e_03boss/frame_79/PlaceObject2_23_11/CLIPACTIONRECORD onClipEvent(enterFrame).as'),'utf8');
  const transformed=transformEnemyScript(source);
  assert.equal(transformed.restoredBranches,0);
  assert.equal(transformed.blocked,11);
  assert.equal(transformed.text,source);
});
test('alternate enemy state without old special regen still gains exactly five',async()=>{
  const source=await readFile(path.join(sources,'DefineSprite_319_e_03/frame_21/PlaceObject2_23_8/CLIPACTIONRECORD onClipEvent(enterFrame).as'),'utf8');
  const transformed=transformEnemyScript(source);
  assert.equal(transformed.replacedExisting,3);
  assert.equal(transformed.restoredBranches,11);
  assert.equal(transformed.text.split(mpRestoreStatement).length-1,11);
});
