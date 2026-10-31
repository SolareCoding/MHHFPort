onClipEvent(enterFrame){
   if(_root.pause == 0)
   {
      with(_parent)
      {
         if(_x < _parent.man._x)
         {
            _xscale = cc;
            f = 0;
         }
         else
         {
            _xscale = - cc;
            f = 1;
         }
      }
      a = random(30);
      if(a == 2)
      {
         _parent.gotoAndPlay("走");
      }
   }
}
