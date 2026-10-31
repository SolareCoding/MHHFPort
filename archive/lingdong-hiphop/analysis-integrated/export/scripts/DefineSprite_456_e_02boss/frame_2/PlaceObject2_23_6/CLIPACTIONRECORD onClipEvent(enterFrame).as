onClipEvent(enterFrame){
   if(_root.pause == 0)
   {
      with(_parent)
      {
         if(_x < _parent.man._x)
         {
            _xscale = - cc;
            f = 0;
         }
         else
         {
            _xscale = cc;
            f = 1;
         }
      }
      a = random(25);
      if(a == 2)
      {
         _parent.gotoAndPlay("走");
      }
      if(a == 3)
      {
         _root.w_wd3.start();
         _parent.gotoAndPlay("跑");
      }
   }
}
