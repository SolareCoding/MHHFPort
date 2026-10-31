onClipEvent(enterFrame){
   hp = _root.game.boss.hp;
   maxhp = _root.game.boss.maxhp;
   if(hp <= 0)
   {
      hp = 0;
   }
   if(hp >= maxhp)
   {
      hp = maxhp;
   }
   if(_root.bos <= 0)
   {
      _parent.gotoAndStop(1);
   }
   _xscale = int(hp / maxhp * 100);
}
