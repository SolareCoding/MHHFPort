onClipEvent(enterFrame){
   if(i > 0)
   {
      i--;
   }
   else if(_parent._alpha > 0)
   {
      _parent._alpha -= 3;
   }
   else
   {
      _parent.play();
   }
}
