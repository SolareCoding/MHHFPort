stop();
_root.pause = 0;
_root.gameBack();
this.onEnterFrame = function()
{
   if(Key.isDown(_root.zt) && _root.pp == 0 && _root.pause == 0 && _root.over == 0 && _root.talk == 0)
   {
      _root.p_pause.start();
      gotoAndStop(3);
   }
   if(Key.isDown(_root.zt) && _root.pp == 0 && _root.pause == 1 && _root.over == 0 && _root.talk == 0)
   {
      _root.p_pause.start();
      gotoAndStop(1);
   }
   if(Key.isDown(_root.zt))
   {
      _root.pp = 1;
   }
   else
   {
      _root.pp = 0;
   }
   if(_root.over == 1 || _root.talk == 1)
   {
      gotoAndStop(1);
      _root.pause = 1;
   }
};
