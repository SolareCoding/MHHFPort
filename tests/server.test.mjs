import { test } from 'node:test';
import assert from 'node:assert/strict';
import { spawn } from 'node:child_process';
import { once } from 'node:events';
import { readFile } from 'node:fs/promises';
import { createHash } from 'node:crypto';

const cwd = new URL('../', import.meta.url);
const port = Number(process.env.TEST_PORT || 18765);

test('standalone repository serves preserved SWFs and Ruffle over HTTP', async t => {
  const child = spawn(process.execPath, ['server.mjs'], { cwd, env: { ...process.env, PORT: String(port) }, windowsHide: true });
  let stderr = '';
  child.stderr.on('data', chunk => { stderr += chunk; });
  try {
    await Promise.race([
      once(child.stdout, 'data'),
      once(child, 'exit').then(([code]) => { throw new Error(`Server exited ${code}: ${stderr}`); }),
      new Promise((_, reject) => { const timer = setTimeout(() => reject(new Error('Server startup timeout')), 5000); timer.unref(); })
    ]);
    const base = `http://127.0.0.1:${port}`;
    await t.test('page loads', async () => {
      const response = await fetch(base);
      assert.equal(response.status, 200);
      assert.match(await response.text(), /灵动嘻哈外传/);
    });
    await t.test('touch control modules are served locally as JavaScript', async () => {
      for (const url of ['/app.js', '/controls.js', '/vendor/nipplejs-1.0.4/index.js']) {
        const response = await fetch(base + url);
        assert.equal(response.status, 200, url);
        assert.match(response.headers.get('content-type'), /javascript/, url);
        assert.ok((await response.text()).length > 100, url);
      }
    });
    const manifest = JSON.parse(await readFile(new URL('../assets-manifest.json', import.meta.url), 'utf8'));
    for (const asset of manifest.files) {
      await t.test(asset.url, async () => {
        const response = await fetch(base + asset.url);
        assert.equal(response.status, 200);
        assert.match(response.headers.get('content-type'), new RegExp(asset.mime.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')));
        const bytes = Buffer.from(await response.arrayBuffer());
        assert.equal(bytes.length, asset.bytes);
        assert.equal(createHash('sha256').update(bytes).digest('hex'), asset.sha256);
      });
    }
    await t.test('private project files and unknown resources are not served', async () => {
      for (const url of ['/package.json', '/server.mjs', '/.git/config', '/missing.swf']) {
        assert.equal((await fetch(base + url)).status, 404, url);
      }
    });
    await t.test('relaxed character URLs serve patched bytes', async () => {
      const patch = JSON.parse(await readFile(new URL('../public/game/relaxed/patch-manifest.json', import.meta.url), 'utf8'));
      for (const character of patch.characters) {
        const response = await fetch(`${base}/game/relaxed/games/data/mhhf_w/${character.id}man.swf`);
        assert.equal(response.status, 200);
        const bytes = Buffer.from(await response.arrayBuffer());
        assert.equal(createHash('sha256').update(bytes).digest('hex'), character.patched_sha256);
      }
    });
    await t.test('direction assist URLs serve the expected modified game', async () => {
      const patch=JSON.parse(await readFile(new URL('../public/game/assist/patch-manifest.json',import.meta.url),'utf8'));
      for(const file of patch.files){
        const response=await fetch(`${base}/game/assist/${file.path}`);
        assert.equal(response.status,200);
        const bytes=Buffer.from(await response.arrayBuffer());
        assert.equal(createHash('sha256').update(bytes).digest('hex'),file.patched_sha256);
      }
    });
    await t.test('combat assist URLs and direct skill UI are present',async()=>{
      const html=await(await fetch(base)).text();
      for(const key of ['1','2','3','4'])assert.ok(html.includes(`data-key="${key}"`));
      const patch=JSON.parse(await readFile(new URL('../public/game/combat/patch-manifest.json',import.meta.url),'utf8'));
      for(const file of patch.files){const response=await fetch(`${base}/game/combat/${file.path}`);assert.equal(response.status,200);const bytes=Buffer.from(await response.arrayBuffer());assert.equal(createHash('sha256').update(bytes).digest('hex'),file.patched_sha256);}
    });
  } finally {
    if (child.exitCode === null) { child.kill(); await once(child, 'exit'); }
  }
});
