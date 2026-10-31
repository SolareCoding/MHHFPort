onClipEvent(load){
   _parent.zhuang.go.gotoAndPlay(2);
   this.onEnterFrame = function()
   {
      if(hitTest(_parent.man.shiti) && _parent.man.f == 0 && _root.rpress == 1)
      {
         delete this.onEnterFrame;
         _parent.gd.gotoAndPlay(2);
      }
   };
}
