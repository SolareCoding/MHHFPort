onClipEvent(enterFrame){
   if(_parent._alpha < 70)
   {
      _parent._alpha += 5;
   }
   else
   {
      _parent.nextFrame();
   }
}
