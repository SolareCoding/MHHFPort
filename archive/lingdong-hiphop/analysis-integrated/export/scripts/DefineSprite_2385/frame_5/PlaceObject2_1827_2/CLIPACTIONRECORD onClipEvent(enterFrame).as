onClipEvent(enterFrame){
   _parent._y += 1;
   if(_parent._alpha > 0)
   {
      _parent._alpha -= 15;
   }
   else
   {
      _root.talk = 0;
      _root.pause = 0;
      _root.gameBack();
      _parent.removeMovieClip();
   }
}
