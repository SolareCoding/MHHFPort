_root.w_wdd.start();
this.onEnterFrame = function()
{
   with(_parent)
   {
      if(f == 0)
      {
         if(_x < _root.smx)
         {
            _x += 30;
         }
         else
         {
            gotoAndPlay("站");
         }
      }
      if(f == 1)
      {
         if(_x > _root.sx)
         {
            _x -= 30;
         }
         else
         {
            gotoAndPlay("站");
         }
      }
   }
};
