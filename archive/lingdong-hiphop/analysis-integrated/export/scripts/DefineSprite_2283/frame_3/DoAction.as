this.swapDepths(1000001);
_root.select.start();
this.onEnterFrame = function()
{
   _parent.man._xscale = _parent.man.cc;
   _root.talk = 1;
   _root.pause = 1;
   _quality = "HIGH";
   if(_alpha < 100)
   {
      _alpha = _alpha + 15;
   }
   else
   {
      delete this.onEnterFrame;
   }
};
