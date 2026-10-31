onClipEvent(enterFrame){
   if(_root.cursor == 0)
   {
      _visible = true;
      _X = _parent._parent.man._x - 20;
      _Y = _parent._parent.man._y - 60;
   }
   else
   {
      _visible = false;
      stop;
      _Y = 4;
   }
}
