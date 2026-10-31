_width = 55;
_height = 12.6;
var cc = _xscale;
stop();
this.onEnterFrame = function()
{
   this.swapDepths(100000 + _Y * 100 + id % 100);
   _X = _parent.man._x;
   _Y = _parent.man.ldd;
   if(_parent.man._xscale == _parent.man.cc)
   {
      _xscale = cc;
   }
   if(_parent.man._xscale == - _parent.man.cc)
   {
      _xscale = - cc;
   }
};
