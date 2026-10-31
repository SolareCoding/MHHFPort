onClipEvent(enterFrame){
   _parent._x -= 8;
   if(_parent._x <= -10)
   {
      _root.talk = 0;
      _root.pause = 0;
      _parent.removeMovieClip();
   }
   if(_parent.hitTest(_parent._parent.man))
   {
      _parent._parent.man._xscale = _parent._parent.man.cc;
      _parent._parent.man.f = 0;
      _parent._parent.talk_03.play();
      _parent.gotoAndStop("站");
   }
}
