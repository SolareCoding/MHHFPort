onClipEvent(enterFrame){
   if(_parent._alpha > 0)
   {
      _parent._alpha -= 5;
   }
   else
   {
      _parent.removeMovieClip();
   }
}
