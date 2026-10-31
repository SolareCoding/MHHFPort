_name = "red";
_width = 70;
_height = 113;
cc = _xscale;
this.onEnterFrame = function()
{
   this.swapDepths(100000 + _Y * 100 + id % 100);
   if(_X > _parent.man._x)
   {
      _xscale = cc;
   }
   if(_X < _parent.man._x)
   {
      _xscale = - cc;
   }
};
