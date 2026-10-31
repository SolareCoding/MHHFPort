onClipEvent(enterFrame){
   _X = _X - 2;
   if(_X <= -820)
   {
      _X = _parent.a._x + (_parent.a._width - 3);
   }
}
