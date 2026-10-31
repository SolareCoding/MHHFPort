onClipEvent(enterFrame){
   _parent._x -= 8;
   if(_parent._x <= -10)
   {
      _root.talk = 0;
      _root.pause = 0;
      _parent.removeMovieClip();
   }
}
