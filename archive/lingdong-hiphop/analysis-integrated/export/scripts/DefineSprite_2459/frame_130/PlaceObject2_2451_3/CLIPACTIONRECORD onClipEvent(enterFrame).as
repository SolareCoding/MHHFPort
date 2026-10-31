onClipEvent(enterFrame){
   _X = _X - 2;
   if(_X <= -820)
   {
      _X = _parent.b._x + (_parent.b._width - 3);
   }
}
