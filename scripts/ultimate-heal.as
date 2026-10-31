// Execute once at the actual MP charge frame, for both buttons and motions.
if (_root.hp > 0 && _root.pause == 0) {
  _root.hp = Math.min(_root.maxhp, _root.hp + Math.max(1, Math.floor(_root.maxhp * 0.15)));
}
