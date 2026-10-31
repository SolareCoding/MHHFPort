onClipEvent(enterFrame){
   if(hitTest(_parent._parent.man.shiti) && _parent._parent.man.inair == false)
   {
      _parent.gotoAndStop(20);
   }
}
