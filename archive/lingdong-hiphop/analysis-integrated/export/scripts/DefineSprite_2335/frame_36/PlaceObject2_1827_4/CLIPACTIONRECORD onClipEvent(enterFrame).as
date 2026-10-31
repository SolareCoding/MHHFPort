onClipEvent(enterFrame){
   _parent._x -= 5;
   if(_parent._alpha > 0)
   {
      _parent._alpha -= 10;
   }
   else
   {
      _root.talk = 0;
      _root.pause = 0;
      _root.gameBack();
      _parent.removeMovieClip();
   }
}
