this.swapDepths(1000001);
_alpha = 0;
_root.talk = 1;
_root.pause = 1;
_root.select.start();
this.onEnterFrame = function()
{
   _quality = "HIGH";
   if(_alpha < 100)
   {
      _alpha = _alpha + 20;
   }
   else
   {
      delete this.onEnterFrame;
   }
};
