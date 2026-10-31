onClipEvent(enterFrame){
   _Y = _Y - 2;
   if(_Y <= 20)
   {
      _Y = _parent.a._y + (_parent.a._height - 3);
   }
}
