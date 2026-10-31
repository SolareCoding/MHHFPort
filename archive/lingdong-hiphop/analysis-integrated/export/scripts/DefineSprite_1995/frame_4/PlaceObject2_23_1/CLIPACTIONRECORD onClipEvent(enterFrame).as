onClipEvent(enterFrame){
   if(i > 0)
   {
      i--;
   }
   else
   {
      _root.combo = 0;
      _parent._x = _parent._y = -100;
      _parent.gotoAndStop(1);
   }
}
