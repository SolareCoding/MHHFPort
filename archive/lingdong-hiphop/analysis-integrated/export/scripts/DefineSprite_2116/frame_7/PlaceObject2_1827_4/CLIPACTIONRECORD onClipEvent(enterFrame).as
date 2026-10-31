onClipEvent(enterFrame){
   _parent._x -= 5;
   if(_parent._alpha > 0)
   {
      _parent._alpha -= 20;
   }
   else
   {
      _root.gameBack();
      _parent._parent.djlou.gotoAndStop("跑");
      _parent.removeMovieClip();
   }
}
