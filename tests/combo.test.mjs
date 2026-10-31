import { test } from 'node:test';
import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import { inflateSync } from 'node:zlib';
import { createHash } from 'node:crypto';
const root = new URL('../', import.meta.url);
const sha = value => createHash('sha256').update(value).digest('hex');
test('relaxed characters change only the ordinary combo reset threshold', async () => {
  const manifest = JSON.parse(await readFile(new URL('public/game/relaxed/patch-manifest.json', root)));
  assert.equal(manifest.characters.length, 3);
  for (const record of manifest.characters) {
    const original = await readFile(new URL(record.source, root));
    const relaxed = await readFile(new URL(`public/game/relaxed/games/data/mhhf_w/${record.id}man.swf`, root));
    assert.equal(sha(original), record.original_sha256);
    assert.equal(sha(relaxed), record.patched_sha256);
    assert.deepEqual(relaxed.subarray(0, 8), original.subarray(0, 8));
    const a = inflateSync(original.subarray(8));
    const b = inflateSync(relaxed.subarray(8));
    assert.equal(a.length, b.length);
    const diffs = [];
    for (let i = 0; i < a.length; i++) if (a[i] !== b[i]) diffs.push(i);
    assert.deepEqual(diffs, [record.decompressed_offset - 8]);
    assert.equal(a[diffs[0]], 15);
    assert.equal(b[diffs[0]], 30);
  }
  assert.deepEqual(await readFile(new URL('public/game/relaxed/a5b.swf', root)),
    await readFile(new URL('public/game/a5b.swf', root)));
});
