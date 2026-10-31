onClipEvent(enterFrame){
   if(hitTest(_parent._parent.man.zhua))
   {
      _parent._parent.man.gotoAndPlay("抓人");
      _parent._name = "Throw";
      _parent.gotoAndStop("被抓");
   }
}
