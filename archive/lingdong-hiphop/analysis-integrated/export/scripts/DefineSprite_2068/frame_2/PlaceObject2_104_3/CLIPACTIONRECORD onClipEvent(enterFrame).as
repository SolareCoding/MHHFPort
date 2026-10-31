onClipEvent(enterFrame){
   hp = _root.game.boss.hp;
   maxhp = _root.game.boss.maxhp;
   aa = int(hp / maxhp * 100);
   if(_xscale < aa)
   {
      _xscale++;
   }
   if(_xscale > aa)
   {
      _xscale--;
   }
   if(hp >= maxhp)
   {
      _xscale = 100;
   }
}
