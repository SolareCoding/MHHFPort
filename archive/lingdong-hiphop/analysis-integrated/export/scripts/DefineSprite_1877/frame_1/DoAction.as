stop();
this.onEnterFrame = function()
{
   if(_root.hp <= 5)
   {
      play();
   }
   else
   {
      gotoAndStop(1);
   }
};
