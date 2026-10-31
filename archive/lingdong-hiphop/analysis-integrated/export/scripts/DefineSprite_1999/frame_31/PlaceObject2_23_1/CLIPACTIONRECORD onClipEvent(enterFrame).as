onClipEvent(enterFrame){
   with(_parent)
   {
      if(_root.diren > 0)
      {
         gotoAndStop(1);
      }
      a++;
      if(a > 100)
      {
         i = 5;
         a = 0;
         gotoAndPlay(2);
      }
   }
}
