onClipEvent(enterFrame){
   if(_root.pause == 0)
   {
      i++;
      if(_parent._parent.man.take == false)
      {
         _parent.gotoAndPlay("站");
      }
      if(i > 100)
      {
         _parent._y += 1;
         _parent._parent.man.gotoAndPlay("站");
         _parent.gotoAndPlay("站");
      }
      else
      {
         if(_parent._parent.man.f == 0)
         {
            _parent._x = _parent._parent.man._x + 25;
            _parent.f = 1;
            _parent._xscale = _parent.cc;
         }
         else
         {
            _parent._x = _parent._parent.man._x - 25;
            _parent.f = 0;
            _parent._xscale = - _parent.cc;
         }
         _parent._y = _parent._parent.man._y - 1;
      }
   }
}
