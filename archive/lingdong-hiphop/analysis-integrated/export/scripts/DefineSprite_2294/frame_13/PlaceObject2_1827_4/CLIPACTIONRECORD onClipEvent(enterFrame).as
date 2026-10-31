onClipEvent(enterFrame){
   _parent._x -= 5;
   if(_parent._alpha > 0)
   {
      _parent._alpha -= 20;
   }
   else
   {
      _root.gameBack();
      _parent._parent.jinling.gotoAndPlay(13);
      _parent._parent.gotoAndStop(91);
      _parent.removeMovieClip();
   }
}
