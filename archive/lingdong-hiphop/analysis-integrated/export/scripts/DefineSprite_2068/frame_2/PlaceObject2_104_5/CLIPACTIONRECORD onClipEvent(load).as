onClipEvent(load){
   hp = _root.game.boss.hp;
   maxhp = _root.game.boss.maxhp;
   _xscale = int(hp / maxhp * 100);
}
