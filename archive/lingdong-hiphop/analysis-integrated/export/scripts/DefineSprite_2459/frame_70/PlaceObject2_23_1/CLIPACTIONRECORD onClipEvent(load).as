onClipEvent(load){
   this.onEnterFrame = function()
   {
      if(hitTest(_parent.man.shiti) && _parent.man.f == 0 && _root.rpress == 1)
      {
         delete this.onEnterFrame;
         _parent.gd.gotoAndPlay(2);
      }
   };
}
