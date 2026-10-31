onClipEvent(enterFrame){
   aa = _parent._x + _parent._width;
   if(_parent._x < _root.sx)
   {
      _parent._x = _root.sx - 40;
   }
   if(aa > _root.smx)
   {
      _parent._x = _root.smx - (_parent._width + 10);
   }
   _parent.play();
}
