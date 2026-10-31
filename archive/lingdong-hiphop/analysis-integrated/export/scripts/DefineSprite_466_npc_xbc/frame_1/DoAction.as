_name = "xbc";
_width = 55.4;
_height = 98.2;
cc = _xscale;
this.onEnterFrame = function()
{
   this.swapDepths(100000 + _Y * 100 + id % 100);
   if(_root.rwalk == 1)
   {
      _X = _X - _parent.man.speed;
   }
   if(_root.rwalk == 2)
   {
      _X = _X - _parent.man.speed * 2;
   }
   if(_root.lwalk == 1)
   {
      _X = _X + _parent.man.speed;
   }
   if(_root.lwalk == 2)
   {
      _X = _X + _parent.man.speed * 2;
   }
   if(_X < _parent.man._x)
   {
      _xscale = - cc;
      f = 0;
   }
   else
   {
      _xscale = cc;
      f = 1;
   }
};
