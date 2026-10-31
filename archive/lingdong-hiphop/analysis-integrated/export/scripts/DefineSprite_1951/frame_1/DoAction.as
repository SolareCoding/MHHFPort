this.onEnterFrame = function()
{
   if(_root.mp >= _root.b_fk)
   {
      gotoAndStop(2);
   }
   else
   {
      gotoAndStop(1);
   }
};
