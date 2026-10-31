onClipEvent(enterFrame){
   _parent._x -= 5;
   _parent._parent.xbc._x += 5;
   _parent._parent.xbc._alpha -= 10;
   if(_parent._alpha > 0)
   {
      _parent._alpha -= 10;
   }
   else
   {
      _root.talk = 0;
      _root.pause = 0;
      _root.gameBack();
      _parent._parent.xbc.removeMovieClip();
      _parent._parent.gd.gotoAndPlay(2);
      _parent.removeMovieClip();
   }
}
