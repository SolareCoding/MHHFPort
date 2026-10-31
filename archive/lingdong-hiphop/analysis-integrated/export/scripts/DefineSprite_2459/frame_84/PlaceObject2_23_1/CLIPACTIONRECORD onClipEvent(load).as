onClipEvent(load){
   this.onEnterFrame = function()
   {
      if(_parent.bj1._x <= -400)
      {
         _parent.gd2.gotoAndPlay(2);
         _parent.gd2.xx = 60;
         _parent.gd2.yy = 220;
         delete this.onEnterFrame;
      }
   };
}
