onClipEvent(enterFrame){
   if(_root.mp >= _root.b_lc)
   {
      _visible = true;
      play();
   }
   else
   {
      _visible = false;
      stop();
   }
}
