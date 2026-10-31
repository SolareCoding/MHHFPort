import { readFile, writeFile, mkdir } from 'node:fs/promises';
import { createHash } from 'node:crypto';
import { pathToFileURL } from 'node:url';
import { decodeSwf, encodeSwf, readTags, writeTag, readActions, constantPool, pushValues } from './swf-tools.mjs';

export const recognizers = { 1: [74,121,154,233,261,458], 2: [67,112,164,288,310,478], 3: [67,109,157,261,280,443] };
export const smallCosts = { b_cz:5, b_fk:10, b_gt1:5, b_gt2:5, b_gt3:10 };
export function costAssignments(data) {
  const actions = readActions(data);
  const poolAction = actions.find(a => a.code === 0x88 && constantPool(a.data).includes('b_gt1'));
  if (!poolAction) return [];
  const pool = constantPool(poolAction.data), matches = [];
  for (let i = 0; i < actions.length - 1; i++) {
    const action = actions[i];
    if (action.code !== 0x96 || actions[i+1].code !== 0x1d) continue;
    const values = pushValues(action.data, pool);
    if (values.length === 2 && /^b_(cz|fk|gt[123]|lc|lw)$/.test(values[0].value) && values[1].type === 7)
      matches.push({ key:values[0].value, value:values[1].value, offset:action.offset + values[1].offset });
  }
  return matches;
}
export function extendRecognizer(data) {
  const header = Buffer.from(data.subarray(0,4));
  const oldFrames = header.readUInt16LE(2);
  header.writeUInt16LE(oldFrames * 2, 2);
  const output = [], frameActions = [];
  let frame = 0, jumps = 0;
  for (const tag of readTags(data,4)) {
    if (tag.code === 12) {
      const actions = Buffer.from(tag.data);
      for (const action of readActions(actions)) {
        if (action.code === 0x81) {
          const target = action.data.readUInt16LE(0);
          if (target >= oldFrames) throw new Error('Out-of-range local jump');
          action.data.writeUInt16LE(target * 2, 0); jumps++;
        }
        if (action.code === 0x8a) throw new Error('Unexpected WaitForFrame');
      }
      const patched = { code:12, data:actions };
      output.push(writeTag(patched)); frameActions.push(patched);
    } else if (tag.code === 1) {
      output.push(writeTag(tag));
      // Repeat recognition only. Never repeat placement, removal or frame labels.
      for (const action of frameActions) output.push(writeTag(action));
      output.push(writeTag(tag)); frameActions.length = 0; frame++;
    } else output.push(writeTag(tag));
  }
  if (frame !== oldFrames || !jumps) throw new Error('Unexpected recognizer timeline');
  return { data:Buffer.concat([header,...output]), oldFrames, newFrames:oldFrames*2, jumps };
}

async function main() {
  const root = new URL('../',import.meta.url), output = new URL('public/game/assist/',root);
  const identity = JSON.parse(await readFile(new URL('assets-manifest.json',root)));
  const sha = bytes => createHash('sha256').update(bytes).digest('hex');
  const records = [];
  await mkdir(new URL('games/data/mhhf_w/',output),{recursive:true});
  for (const id of [0,1,2,3]) {
    const relative = id ? `games/data/mhhf_w/${id}man.swf` : 'a5b.swf';
    const sourcePath = `public/game/${relative}`;
    const source = await readFile(new URL(sourcePath,root));
    if (sha(source) !== identity.files.find(x=>x.file===sourcePath)?.sha256) throw new Error('Original identity mismatch');
    const {body,start,header} = decodeSwf(source);
    const changes = [];
    const tags = readTags(body,start).map(tag => {
      if (id === 0 && tag.code === 12) {
        const matches = costAssignments(tag.data);
        if (matches.length) {
          const data = Buffer.from(tag.data);
          for (const key of Object.keys(smallCosts)) {
            const found = matches.filter(x=>x.key===key);
            if (found.length!==1 || found[0].value!==smallCosts[key]) throw new Error(`Unexpected cost ${key}`);
            data.writeInt32LE(0,found[0].offset); changes.push({key,from:found[0].value,to:0});
          }
          for (const [key,value] of [['b_lc',100],['b_lw',130]])
            if (matches.find(x=>x.key===key)?.value!==value) throw new Error('Unexpected large-special cost');
          return {...tag,data};
        }
      }
      if (id && tag.code === 39 && recognizers[id].includes(tag.data.readUInt16LE(0))) {
        const extended = extendRecognizer(tag.data);
        changes.push({sprite:tag.data.readUInt16LE(0),oldFrames:extended.oldFrames,newFrames:extended.newFrames,jumps:extended.jumps});
        return {...tag,data:extended.data};
      }
      return tag;
    });
    if (changes.length !== (id ? 6 : 5)) throw new Error('Incomplete patch');
    const patched = encodeSwf(header,Buffer.concat([body.subarray(0,start),...tags.map(writeTag)]));
    await writeFile(new URL(relative,output),patched);
    records.push({id,path:relative,original_sha256:sha(source),patched_sha256:sha(patched),changes});
  }
  await writeFile(new URL('patch-manifest.json',output),JSON.stringify({fps:25,description:'Extended invisible direction-recognition timelines; small specials free; large costs unchanged; original ordinary combo timer',files:records},null,2)+'\n');
  console.log('Generated directional assist variant.');
}
if (process.argv[1] && pathToFileURL(process.argv[1]).href === import.meta.url) await main();
