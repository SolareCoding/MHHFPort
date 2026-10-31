onClipEvent(load){
   this.onEnterFrame = function()
   {
      if(_parent.bj1._x <= -400)
      {
         _parent.gd2.gotoAndPlay(2);
         _parent.gd2.xx = 150;
         _parent.gd2.yy = 190;
         delete this.onEnterFrame;
      }
   };
}
