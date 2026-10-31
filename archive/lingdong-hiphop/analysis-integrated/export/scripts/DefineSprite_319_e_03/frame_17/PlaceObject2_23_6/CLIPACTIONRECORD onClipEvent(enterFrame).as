onClipEvent(enterFrame){
   if(hitTest(_parent._parent.man.shiti) && !_parent._parent.man.inair && _root.without == 0 && aa == 0)
   {
      aa = 1;
      hx = random(_parent.phit);
      if(hx == 0)
      {
         _parent._parent.man.atkS = 1;
         _parent._parent.man.gotoAndPlay("倒");
         _root.hit_q3.start();
         _root.hp -= _parent.atk + 5;
      }
      else
      {
         _parent._parent.man.atkS = 0;
         _parent._parent.man.gotoAndPlay("挨打");
         _root.hit_q3.start();
         _root.hp -= _parent.atk;
      }
      if(_parent._x > _parent._parent.man._x && _parent._parent.man._x > _root.sx)
      {
         _parent._parent.man._x -= 5;
      }
      if(_parent._x <= _parent._parent.man._x && _parent._parent.man._x < _root.smx)
      {
         _parent._parent.man._x += 5;
      }
   }
   else
   {
      if(_parent.f == 1)
      {
         _parent._x -= 18;
      }
      if(_parent.f == 0)
      {
         _parent._x += 18;
      }
   }
}
