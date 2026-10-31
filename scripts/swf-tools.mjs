import { inflateSync, deflateSync } from 'node:zlib';

export function decodeSwf(source) {
  const signature = source.toString('ascii', 0, 3);
  if (!['CWS', 'FWS'].includes(signature)) throw new Error('Unsupported SWF');
  const body = signature === 'CWS' ? inflateSync(source.subarray(8)) : Buffer.from(source.subarray(8));
  if (body.length + 8 !== source.readUInt32LE(4)) throw new Error('Invalid SWF size');
  const start = Math.ceil((5 + 4 * (body[0] >> 3)) / 8) + 4;
  return { body, start, header: source.subarray(0, 8) };
}
export function encodeSwf(header, body) {
  const updated = Buffer.from(header);
  updated.write('CWS', 0, 'ascii');
  updated.writeUInt32LE(body.length + 8, 4);
  return Buffer.concat([updated, deflateSync(body)]);
}
export function readTags(bytes, start = 0) {
  const tags = [];
  while (start < bytes.length) {
    const header = bytes.readUInt16LE(start); start += 2;
    let size = header & 63;
    if (size === 63) { size = bytes.readUInt32LE(start); start += 4; }
    if (start + size > bytes.length) throw new Error('Invalid tag length');
    tags.push({ code: header >> 6, data: bytes.subarray(start, start + size) });
    start += size;
    if ((header >> 6) === 0) break;
  }
  if (start !== bytes.length) throw new Error('Trailing tag bytes');
  return tags;
}
export function writeTag({ code, data }) {
  const header = Buffer.alloc(data.length < 63 ? 2 : 6);
  header.writeUInt16LE((code << 6) | Math.min(data.length, 63));
  if (data.length >= 63) header.writeUInt32LE(data.length, 2);
  return Buffer.concat([header, data]);
}
export function readActions(bytes) {
  const actions = [];
  for (let offset = 0; offset < bytes.length;) {
    const code = bytes[offset++];
    const size = code >= 0x80 ? bytes.readUInt16LE(offset) : 0;
    if (code >= 0x80) offset += 2;
    if (offset + size > bytes.length) throw new Error('Invalid action length');
    actions.push({ code, offset, data: bytes.subarray(offset, offset + size) });
    offset += size;
    // Obfuscated AVM1 can contain data after End; keep walking for static matching.
  }
  return actions;
}
export function constantPool(data) {
  const count = data.readUInt16LE(0), pool = [];
  let offset = 2;
  for (let i = 0; i < count; i++) {
    const end = data.indexOf(0, offset);
    if (end < 0) throw new Error('Invalid constant pool');
    pool.push(data.toString('utf8', offset, end)); offset = end + 1;
  }
  return pool;
}
export function pushValues(data, pool = []) {
  const values = [];
  for (let p = 0; p < data.length;) {
    const type = data[p++], offset = p;
    let value;
    if (type === 0) { const end = data.indexOf(0, p); if (end < 0) throw new Error('Invalid string'); value = data.toString('utf8', p, end); p = end + 1; }
    else if (type === 7) { value = data.readInt32LE(p); p += 4; }
    else if (type === 8) { value = pool[data[p++]]; }
    else if (type === 9) { value = pool[data.readUInt16LE(p)]; p += 2; }
    else if ([1, 6].includes(type)) p += type === 1 ? 4 : 8;
    else if ([4, 5].includes(type)) p++;
    else if (![2, 3].includes(type)) throw new Error(`Unexpected Push type ${type}`);
    values.push({ type, offset, value });
  }
  return values;
}
