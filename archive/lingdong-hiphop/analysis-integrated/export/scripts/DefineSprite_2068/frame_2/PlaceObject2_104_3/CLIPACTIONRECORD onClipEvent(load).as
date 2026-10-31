onClipEvent(load){
   _alpha = 70;
   hp = _root.game.boss.hp;
   maxhp = _root.game.boss.maxhp;
   _xscale = int(hp / maxhp * 100);
}
