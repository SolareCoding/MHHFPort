onClipEvent(enterFrame){
   if(hitTest(_parent._parent.man.shiti) && _parent._parent.man.inair == false)
   {
      _parent._parent.talk_03.play();
      _parent.play();
   }
}
