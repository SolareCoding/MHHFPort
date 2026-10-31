onClipEvent(enterFrame){
   if(i > 30 && _root.pause == 0)
   {
      _root.hp++;
      i = 0;
   }
   else
   {
      i++;
   }
}
