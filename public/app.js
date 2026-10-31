import { setupControls } from './controls.js';

const stage = document.getElementById('stage');
const start = document.getElementById('start');
const restart = document.getElementById('restart');
const fullscreen = document.getElementById('fullscreen');
const sound = document.getElementById('sound');
const status = document.getElementById('status');
const diagnostics = document.getElementById('diagnostics');
let player;
let muted = false;
const controls = setupControls(() => player);
controls.enable(false);

function showResources() {
  const loaded = performance.getEntriesByType('resource').filter(x => /\.swf(?:\?|$)/.test(x.name));
  document.getElementById('resources').replaceChildren(...loaded.map(x => {
    const li = document.createElement('li');
    li.textContent = new URL(x.name).pathname + ' · 已请求';
    return li;
  }));
}
new PerformanceObserver(showResources).observe({ entryTypes: ['resource'] });

async function boot() {
  controls.enable(false);
  start.disabled = true;
  restart.disabled = true;
  status.textContent = '正在加载游戏…';
  try {
    const ruffle = window.RufflePlayer?.newest();
    if (!ruffle) throw new Error('Ruffle 运行库尚未准备好，请刷新后重试。');
    player?.remove();
    player = ruffle.createPlayer();
    stage.replaceChildren(player);
    player.addEventListener('loadedmetadata', () => {
      diagnostics.textContent = 'Ruffle 0.7.1\n' + JSON.stringify(player.ruffle().metadata, null, 2);
    });
    await player.ruffle().load({
      url: new URL('./game/a5b.swf', location.href).href, base: new URL('./game/', location.href).href,
      autoplay: 'on', unmuteOverlay: 'visible', backgroundColor: '#ffffff',
      scale: 'showAll', forceScale: true, letterbox: 'on',
      allowScriptAccess: false, openUrlMode: 'deny', logLevel: 'warn',
      splashScreen: false, contextMenu: 'on'
    });
    player.ruffle().volume = muted ? 0 : 1;
    controls.enable(true);
    status.textContent = '已载入 · 点击画面开始操作';
    fullscreen.disabled = sound.disabled = restart.disabled = false;
    start.hidden = true;
    player.focus();
    showResources();
  } catch (error) {
    status.textContent = '加载失败';
    diagnostics.textContent = String(error.stack || error);
    start.hidden = false;
    start.disabled = false;
    restart.disabled = false;
    document.querySelector('details').open = true;
    console.error(error);
  }
}
start.addEventListener('click', boot);
restart.addEventListener('click', boot);
fullscreen.addEventListener('click', async () => {
  controls.clear();
  const card = document.querySelector('.player-card');
  try {
    if (document.fullscreenElement) await document.exitFullscreen();
    else if (card.requestFullscreen) await card.requestFullscreen();
    else {
      card.classList.toggle('expanded');
      fullscreen.textContent = card.classList.contains('expanded') ? '退出大屏' : '全屏';
    }
  } catch {
    card.classList.toggle('expanded');
    fullscreen.textContent = card.classList.contains('expanded') ? '退出大屏' : '全屏';
  }
  player?.focus({ preventScroll: true });
});
document.addEventListener('fullscreenchange', () => {
  fullscreen.textContent = document.fullscreenElement ? '退出全屏' : '全屏';
});
sound.addEventListener('click', () => {
  muted = !muted;
  player.ruffle().volume = muted ? 0 : 1;
  sound.textContent = muted ? '开启声音' : '静音';
  player.focus();
});
window.addEventListener('keydown', event => {
  if (player && ['Space', 'ArrowUp', 'ArrowDown', 'ArrowLeft', 'ArrowRight'].includes(event.code)) event.preventDefault();
});
