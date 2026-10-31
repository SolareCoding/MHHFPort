_alpha = 0;
_root.talk = 1;
_root.pause = 1;
_root.select.start();
if(_root.conceal_2 == 1)
{
   gotoAndStop("隐藏对话");
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
