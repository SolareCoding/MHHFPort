_alpha = 0;
_root.talk = 1;
_root.pause = 1;
_root.select.start();
if(_root.conceal_21 == 0)
{
   play();
}
if(_root.conceal_21 == 1)
{
   gotoAndStop("剧情二");
   play();
}
if(_root.conceal_21 == 2)
{
   gotoAndStop("剧情三");
   play();
}
if(_root.conceal_21 == 3)
{
   gotoAndStop("剧情四");
   play();
}
this.onEnterFrame = function()
{
   _parent.man._xscale = _parent.man.cc;
   _quality = "HIGH";
   if(_alpha < 100)
   {
      _alpha = _alpha + 20;
   }
   else
   {
      delete this.onEnterFrame;
   }
};
