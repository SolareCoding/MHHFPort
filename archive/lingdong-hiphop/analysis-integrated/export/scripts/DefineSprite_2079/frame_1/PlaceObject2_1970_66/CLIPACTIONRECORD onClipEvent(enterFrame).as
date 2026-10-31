onClipEvent(enterFrame){
   if(_root.pause == 0 && _root.over == 0)
   {
      if(i > 0)
      {
         i--;
      }
      else
      {
         _root.Time--;
         i = 200;
      }
      if(_root.Time <= 0)
      {
         _root.hp = 0;
         _root.Time = 0;
      }
      if(_root.Time >= 99)
      {
         _root.Time = 99;
      }
   }
}
