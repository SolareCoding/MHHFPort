import { setupControls } from './controls.js?v=combat3';

const stage = document.getElementById('stage');
const start = document.getElementById('start');
const restart = document.getElementById('restart');
const fullscreen = document.getElementById('fullscreen');
const sound = document.getElementById('sound');
const status = document.getElementById('status');
const diagnostics = document.getElementById('diagnostics');
const comboMode = document.getElementById('combo-mode');
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
  const selectedMode = comboMode.value;
  document.getElementById('touch-controls').classList.toggle('awaiting-player', selectedMode === 'combat');
  const gameBase = selectedMode === 'combat' ? './game/combat/' : selectedMode === 'assist' ? './game/assist/' : selectedMode === 'relaxed' ? './game/relaxed/' : './game/';
  comboMode.disabled = true;
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
      url: new URL(gameBase + 'a5b.swf', location.href).href,
      base: new URL(gameBase, location.href).href,
      autoplay: 'on', unmuteOverlay: 'visible', backgroundColor: '#ffffff',
      scale: 'showAll', forceScale: true, letterbox: 'on',
      allowScriptAccess: false, openUrlMode: 'deny', logLevel: 'warn',
      splashScreen: false, contextMenu: 'on'
    });
    player.ruffle().volume = muted ? 0 : 1;
    player.ruffle().traceObserver = message => {
      if (String(message) === 'MHHF_PLAYER|ready') {
        document.getElementById('touch-controls').classList.remove('awaiting-player');
        return;
      }
      if (!String(message).startsWith('MHHF_SKILL|')) return;
      const [, result, name, cost] = String(message).split('|');
      const label = ({ '飞空':'飞空', '飞空2':'飞空下劈', '鬼步1':'鬼步1', '鬼步2':'鬼步2', '鬼步3':'鬼步3', '龙出前':'龙出', '乱舞前':'乱舞' })[name] || '技能';
      status.textContent = result === 'mp' ? `${label}：MP不足，需要${cost}` : result === 'busy' ? `${label}：当前动作不可衔接` : result === 'queue' ? `${label}：已缓冲衔接` : `${label}已起手 · 可继续方向＋攻击`;
    };
    controls.enable(true, selectedMode === 'combat');
    status.textContent = selectedMode === 'combat' ? '战斗优化 · 大招100/130MP' : selectedMode === 'assist' ? '必杀宽松 · 小招免费' : selectedMode === 'relaxed' ? '普通连击宽松版 · 已载入' : '原版判定 · 已载入';
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
  } finally {
    comboMode.disabled = false;
  }
}
start.addEventListener('click', boot);
restart.addEventListener('click', boot);
comboMode.addEventListener('change', () => {
  controls.clear();
  if (player) status.textContent = '点击重新启动以应用判定（会丢失当前进度）';
});
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

const options = document.getElementById("options");
options.addEventListener("click", () => {
  const open = options.closest(".toolbar").classList.toggle("options-open");
  options.setAttribute("aria-expanded", String(open));
});
