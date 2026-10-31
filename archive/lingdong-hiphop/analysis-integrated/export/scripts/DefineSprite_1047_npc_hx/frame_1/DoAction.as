stop();
_name = "black";
_width = 88.7;
_height = 109.8;
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
