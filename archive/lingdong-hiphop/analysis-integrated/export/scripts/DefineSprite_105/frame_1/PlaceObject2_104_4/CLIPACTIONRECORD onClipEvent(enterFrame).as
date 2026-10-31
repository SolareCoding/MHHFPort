onClipEvent(enterFrame){
   if(_parent._parent.hp <= 0)
   {
      _parent._parent.hp = 0;
   }
   if(_parent._parent.hp >= _parent._parent.maxhp)
   {
      _parent._parent.hp = _parent._parent.maxhp;
   }
   _xscale = int(_parent._parent.hp / _parent._parent.maxhp * 100);
}
