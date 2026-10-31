stop();
this.onEnterFrame = function()
{
   if(_root.mp >= _root.maxmp)
   {
      play();
   }
   else
   {
      gotoAndStop(1);
   }
};
