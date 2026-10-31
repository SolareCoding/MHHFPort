if(_root.ll == 0 && _root.rr == 1 && _root.uu == 0 && _root.dd == 0 && _root.gg == 1 && _root.atkpress == 0 && _root.mp >= _root.b_lw)
{
   _root.dong = 1;
   _root.keyBack();
   _parent.gotoAndPlay("乱舞前");
}
else if(_root.ll == 0 && _root.rr == 1 && _root.uu == 0 && _root.dd == 0 && _root.mp >= _root.b_lw)
{
   bname = "乱舞前";
   gotoAndStop("延迟");
   play();
}
