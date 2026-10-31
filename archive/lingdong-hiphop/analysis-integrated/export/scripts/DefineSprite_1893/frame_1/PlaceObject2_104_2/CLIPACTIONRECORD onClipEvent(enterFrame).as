onClipEvent(enterFrame){
   aa = int(_root.ex / _root.maxex * 100);
   if(aa <= 0)
   {
      aa = 0;
   }
   if(aa >= 100)
   {
      aa = 100;
   }
   if(_xscale < aa)
   {
      _xscale++;
   }
   if(_xscale == aa)
   {
      _xscale = aa;
   }
   if(_xscale > aa)
   {
      _xscale--;
   }
   if(_root.ex >= _root.maxex)
   {
      _root.levelup.start();
      _root.enemyLoad("levelmcZ",0,350);
      _root.enemyLoad("levelmcZ",400,350);
      _root.enemyLoad("levelmcZ",0,-20);
      _root.enemyLoad("levelmcZ",400,-20);
      _root.ex = 0;
      _xscale = _root.ex;
      _root.lv++;
      _root.MAtk += random(2) + 2;
      _root.maxex += _root.lv * 20;
      _root.maxhp += random(5) + 15;
      _root.maxmp += random(5) + 10;
      _root.hp += int(_root.maxhp / 2);
      _root.mp += int(_root.maxmp / 2);
   }
}
