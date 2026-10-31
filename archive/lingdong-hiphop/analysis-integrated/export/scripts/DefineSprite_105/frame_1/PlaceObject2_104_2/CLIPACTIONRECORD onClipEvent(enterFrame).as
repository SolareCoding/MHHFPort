onClipEvent(enterFrame){
   aa = int(_parent._parent.hp / _parent._parent.maxhp * 100);
   if(_xscale < aa)
   {
      _xscale++;
   }
   if(_xscale > aa)
   {
      _xscale--;
   }
   if(_parent._parent.hp >= _parent._parent.maxhp)
   {
      _xscale = 100;
   }
}
