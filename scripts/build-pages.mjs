import { cp, mkdir, rm, writeFile } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const output = path.join(root, 'dist');
// Fixed build destination inside this repository, never caller-supplied.
await rm(output, { recursive: true, force: true });
await mkdir(output, { recursive: true });
await cp(path.join(root, 'public'), output, { recursive: true });
await cp(path.join(root, 'vendor', 'ruffle-0.7.1'), path.join(output, 'ruffle'), {
  recursive: true, filter: source => !source.endsWith('.map')
});
await writeFile(path.join(output, '.nojekyll'), '');
console.log('Static site built in dist/ (public files + Ruffle only).');
