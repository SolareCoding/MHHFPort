onClipEvent(enterFrame){
   i++;
   if(i > 10)
   {
      _parent.freeze = false;
      _parent.gotoAndPlay("站");
   }
}
