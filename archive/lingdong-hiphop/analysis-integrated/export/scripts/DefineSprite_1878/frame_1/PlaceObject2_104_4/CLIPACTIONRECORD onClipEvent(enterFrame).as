onClipEvent(enterFrame){
   aa = int(_root.hp / _root.maxhp * 100);
   if(_xscale < aa)
   {
      _xscale++;
   }
   if(_xscale > aa)
   {
      _xscale--;
   }
   if(_root.hp >= _root.maxhp)
   {
      _xscale = 100;
   }
}
