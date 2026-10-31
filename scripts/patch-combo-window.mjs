import { readFile, writeFile, mkdir, copyFile } from 'node:fs/promises';
import { inflateSync, deflateSync } from 'node:zlib';
import { createHash } from 'node:crypto';
const root = new URL('../', import.meta.url);
const manifest = JSON.parse(await readFile(new URL('assets-manifest.json', root), 'utf8'));
const output = new URL('public/game/relaxed/', root);
const sha = bytes => createHash('sha256').update(bytes).digest('hex');
const records = [];
await mkdir(new URL('games/data/mhhf_w/', output), { recursive: true });
await copyFile(new URL('public/game/a5b.swf', root), new URL('a5b.swf', output));
for (let id = 1; id <= 3; id++) {
  const sourcePath = `public/game/games/data/mhhf_w/${id}man.swf`;
  const source = await readFile(new URL(sourcePath, root));
  if (sha(source) !== manifest.files.find(x => x.file === sourcePath)?.sha256) throw new Error('Unexpected original SWF');
  if (source.toString('ascii', 0, 3) !== 'CWS') throw new Error('Expected zlib SWF');
  const body = inflateSync(source.subarray(8));
  if (body.length + 8 !== source.readUInt32LE(4)) throw new Error('Invalid SWF length');
  // AVM1: Push constant51 (t); GetVariable; Push integer15; Less2.
  const signature = Buffer.from('96020008331c960500070f00000048', 'hex');
  const at = body.indexOf(signature);
  if (at < 0 || body.indexOf(signature, at + 1) >= 0) throw new Error('Ambiguous timer instruction');
  let cursor = Math.ceil((5 + 4 * (body[0] >> 3)) / 8) + 4;
  let owner;
  while (cursor < body.length) {
    const header = body.readUInt16LE(cursor); cursor += 2;
    const code = header >> 6;
    let size = header & 63;
    if (size === 63) { size = body.readUInt32LE(cursor); cursor += 4; }
    if (cursor + size > body.length) throw new Error('Invalid tag');
    if (at >= cursor && at + signature.length <= cursor + size) owner = { code, offset: cursor, size };
    cursor += size;
    if (code === 0) break;
  }
  if (owner?.code !== 12) throw new Error('Timer is not in a root DoAction');
  const actions = body.subarray(owner.offset, owner.offset + owner.size);
  if (!actions.includes(Buffer.from('hitLeave\0')) || !actions.includes(Buffer.from('onEnterFrame\0'))) throw new Error('Unexpected timer context');
  body[at + 10] = 30;
  const patched = Buffer.concat([source.subarray(0, 8), deflateSync(body)]);
  await writeFile(new URL(`games/data/mhhf_w/${id}man.swf`, output), patched);
  records.push({ id, source: sourcePath, original_sha256: sha(source), patched_sha256: sha(patched),
    decompressed_offset: at + 8 + 10, old_frames: 15, new_frames: 30, changed_uncompressed_bytes: 1 });
}
await writeFile(new URL('patch-manifest.json', output), JSON.stringify({
  description: 'Ordinary combo hitLeave periodic reset threshold only; special-move timelines unchanged',
  fps: 25, characters: records
}, null, 2) + '\n');
console.log('Generated relaxed variant for all three characters; original files unchanged.');
