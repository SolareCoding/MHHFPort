import nipplejs from './vendor/nipplejs-1.0.4/index.js';

const keyCodes = { w: 87, a: 65, s: 83, d: 68, j: 74, k: 75, i: 73, 1:49, 2:50, 3:51, 4:52 };

// Each pointer owns its keys: releasing one finger must not release another's key.
export function createInput(getPlayer, onChange = () => {}) {
  const sources = new Map();
  let held = new Set();
  function update() {
    const next = new Set([...sources.values()].flat());
    const player = getPlayer();
    for (const key of new Set([...held, ...next])) {
      if (held.has(key) === next.has(key)) continue;
      player?.dispatchEvent(new KeyboardEvent(next.has(key) ? 'keydown' : 'keyup', {
        key, code: /^[1-4]$/.test(key) ? `Digit${key}` : `Key${key.toUpperCase()}`, keyCode: keyCodes[key], which: keyCodes[key],
        bubbles: true, composed: true, cancelable: true
      }));
    }
    held = next;
    onChange([...held]);
  }
  return {
    set(source, keys) { if (keys.length) sources.set(source, keys); else sources.delete(source); update(); },
    clear() { sources.clear(); update(); }
  };
}

export function directionKeys({ x, y }, force) {
  if (force < 0.22) return [];
  const angle = Math.atan2(y, x);
  const sector = Math.round(angle / (Math.PI / 4));
  return ({ '-4': ['a'], '-3': ['a', 's'], '-2': ['s'], '-1': ['s', 'd'],
    0: ['d'], 1: ['d', 'w'], 2: ['w'], 3: ['w', 'a'], 4: ['a'] })[sector];
}

export function setupControls(getPlayer) {
  const panel = document.getElementById('touch-controls');
  const zone = document.getElementById('joystick-zone');
  const buttons = [...document.querySelectorAll('.player-card [data-key]')];
  const readout = document.getElementById('input-status');
  const pointers = new Map();
  const releases = new Map();
  let enabled = false;
  const input = createInput(getPlayer, keys => {
    readout.textContent = keys.length ? `触控：${keys.map(k => k.toUpperCase()).join(' + ')}` : '触控：已松开';
    for (const button of buttons) button.classList.toggle('pressed', keys.includes(button.dataset.key));
  });
  const focusPlayer = () => getPlayer()?.focus({ preventScroll: true });
  const joystick = nipplejs.create({
    zone, mode: 'static', position: { left: '50%', top: '50%' },
    color: '#d9bc80', size: 110, restOpacity: 0.65, fadeTime: 100
  });
  joystick.on('start', () => { if (enabled) focusPlayer(); });
  joystick.on('move', event => {
    if (enabled) input.set('joystick', directionKeys(event.data.vector, event.data.force));
  });
  joystick.on('end', () => input.set('joystick', []));
  // Keep receiving moves when a finger leaves the visible joystick circle.
  zone.addEventListener('pointerdown', event => {
    event.preventDefault();
    if (!enabled) return;
    focusPlayer();
    zone.setPointerCapture(event.pointerId);
  });
  for (const type of ['pointercancel', 'lostpointercapture']) {
    zone.addEventListener(type, () => input.set('joystick', []));
  }
  for (const button of buttons) {
    button.addEventListener('pointerdown', event => {
      event.preventDefault();
      if (!enabled || button.disabled || (event.pointerType === 'mouse' && event.button !== 0)) return;
      focusPlayer();
      button.setPointerCapture(event.pointerId);
      clearTimeout(releases.get(event.pointerId));
      releases.delete(event.pointerId);
      pointers.set(event.pointerId, { button, started: performance.now() });
      input.set(`pointer:${event.pointerId}`, [button.dataset.key]);
    });
    const release = event => {
      const pointer = pointers.get(event.pointerId);
      if (pointer?.button !== button) return;
      pointers.delete(event.pointerId);
      const finish = () => {
        releases.delete(event.pointerId);
        input.set(`pointer:${event.pointerId}`, []);
      };
      // The SWF polls keys at 25 fps. A very quick tap must span a frame.
      const remaining = event.type === 'pointerup' ? 70 - (performance.now() - pointer.started) : 0;
      if (remaining > 0) releases.set(event.pointerId, setTimeout(finish, remaining));
      else finish();
    };
    for (const type of ['pointerup', 'pointercancel', 'lostpointercapture']) button.addEventListener(type, release);
    button.addEventListener('contextmenu', event => event.preventDefault());
    // Keyboard / assistive activation does not produce pointerdown.
    button.addEventListener('click', event => {
      if (!enabled || button.disabled || event.detail !== 0) return;
      focusPlayer();
      const source = `activate:${button.dataset.key}`;
      input.set(source, [button.dataset.key]);
      setTimeout(() => input.set(source, []), 100);
    });
  }
  function clear() {
    for (const timer of releases.values()) clearTimeout(timer);
    releases.clear();
    input.clear();
    for (const [id, { button }] of pointers) {
      if (button.hasPointerCapture(id)) button.releasePointerCapture(id);
    }
    pointers.clear();
  }
  window.addEventListener('blur', clear);
  window.addEventListener('pagehide', clear);
  document.addEventListener('visibilitychange', () => { if (document.hidden) clear(); });
  window.addEventListener('resize', clear);
  document.addEventListener('fullscreenchange', clear);
  return {
    clear,
    enable(value, directSkills = false) {
      clear(); enabled = value;
      panel.classList.toggle('controls-disabled', !value);
      for (const button of buttons) button.disabled = !value || (button.classList.contains('skill-button') && !directSkills);
    }
  };
}
