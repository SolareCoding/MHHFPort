onClipEvent(enterFrame){
   _Y = _Y - 2;
   if(_Y <= 20)
   {
      _Y = _parent.b._y + (_parent.b._height - 3);
   }
}
