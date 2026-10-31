stop();
this.swapDepths(1000001);
_alpha = 0;
this.onEnterFrame = function()
{
   if(_root.pause == 0)
   {
      play();
      delete this.onEnterFrame;
   }
};
