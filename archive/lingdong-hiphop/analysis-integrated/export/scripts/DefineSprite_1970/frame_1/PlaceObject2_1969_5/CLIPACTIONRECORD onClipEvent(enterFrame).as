onClipEvent(enterFrame){
   if(_root.Time > -1 && _root.Time < 6)
   {
      play();
   }
   else
   {
      gotoAndStop(1);
   }
}
