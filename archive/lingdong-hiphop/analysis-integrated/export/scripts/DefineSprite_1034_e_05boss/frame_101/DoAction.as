aaa = random(10);
if(aaa < 3)
{
   _X = _parent.man._x - 30;
   _Y = _parent.man._y;
}
else
{
   _X = random(_root.smx);
   _Y = random(_root.syy) + _root.sy;
}
_root.w_wd3.start();
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
