import http from 'node:http';
import { createReadStream, appendFileSync } from 'node:fs';
import { stat } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const root = path.dirname(fileURLToPath(import.meta.url));
const artifactRoot = path.dirname(root);
const port = Number(process.env.PORT || 8765);
const mime = { '.html': 'text/html; charset=utf-8', '.js': 'text/javascript; charset=utf-8', '.css': 'text/css; charset=utf-8', '.wasm': 'application/wasm', '.swf': 'application/x-shockwave-flash', '.json': 'application/json; charset=utf-8', '.map': 'application/json' };
const logPath = path.join(root, 'requests.log');
const mappings = new Map([
  ['/game/a5b.swf', path.join(artifactRoot, 'lingdong-hiphop-integrated.swf')],
  ...[1, 2, 3].map(n => [`/game/games/data/mhhf_w/${n}man.swf`, path.join(artifactRoot, 'analysis-integrated', 'dependencies', `${n}man.swf`)])
]);

function staticPath(base, suffix) {
  const candidate = path.resolve(base, '.' + suffix);
  return candidate.startsWith(base + path.sep) ? candidate : null;
}
const server = http.createServer(async (req, res) => {
  let pathname;
  try { pathname = decodeURIComponent(new URL(req.url, 'http://localhost').pathname); }
  catch { res.writeHead(400).end(); return; }
  if (!['GET', 'HEAD'].includes(req.method)) { res.writeHead(405).end(); return; }
  const entry = pathname === '/' ? '/index.html' : pathname;
  const target = mappings.get(entry) || (entry.startsWith('/ruffle/')
    ? staticPath(path.join(root, 'vendor', 'ruffle-0.7.1'), entry.slice('/ruffle'.length))
    : staticPath(path.join(root, 'public'), entry));
  try {
    if (!target) throw new Error('Invalid path');
    const info = await stat(target);
    if (!info.isFile()) throw new Error('Not a file');
    res.writeHead(200, { 'Content-Type': mime[path.extname(target)] || 'application/octet-stream', 'Content-Length': info.size, 'Cache-Control': 'no-cache', 'X-Content-Type-Options': 'nosniff', 'Content-Security-Policy': "default-src 'self'; script-src 'self' 'wasm-unsafe-eval'; style-src 'self' 'unsafe-inline'; img-src 'self' data: blob:; connect-src 'self'; media-src 'self' blob:; object-src 'none'" });
    if (req.method === 'HEAD') res.end();
    else createReadStream(target).pipe(res);
    appendFileSync(logPath, `${new Date().toISOString()} 200 ${pathname}\n`);
  } catch {
    appendFileSync(logPath, `${new Date().toISOString()} 404 ${pathname}\n`);
    res.writeHead(404, { 'Content-Type': 'text/plain; charset=utf-8' }).end('Not found');
  }
});
server.listen(port, '127.0.0.1', () => console.log(`灵动嘻哈外传：http://127.0.0.1:${port}\n按 Ctrl+C 停止服务。`));
server.on('error', error => { console.error(error.message); process.exitCode = 1; });
