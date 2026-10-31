onClipEvent(enterFrame){
   if(_alpha < 100)
   {
      _alpha = _alpha + 3;
   }
   else
   {
      _parent.nextFrame();
   }
}
