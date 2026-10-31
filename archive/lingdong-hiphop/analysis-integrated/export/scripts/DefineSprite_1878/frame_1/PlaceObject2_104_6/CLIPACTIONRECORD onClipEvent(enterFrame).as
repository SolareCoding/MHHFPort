onClipEvent(enterFrame){
   if(_root.hp <= 0 || _root.over == 1)
   {
      _root.hp = 0;
   }
   if(_root.hp >= _root.maxhp)
   {
      _root.hp = _root.maxhp;
   }
   _xscale = int(_root.hp / _root.maxhp * 100);
}
