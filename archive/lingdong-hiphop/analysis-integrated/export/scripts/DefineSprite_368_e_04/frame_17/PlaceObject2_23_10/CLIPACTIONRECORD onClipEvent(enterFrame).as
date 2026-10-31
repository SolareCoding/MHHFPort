onClipEvent(enterFrame){
   if(hitTest(_parent._parent.man.shiti) && !_parent._parent.man.inair && _root.without == 0 && aa == 0)
   {
      aa = 1;
      _parent._parent.man.atkS = 1;
      _parent._parent.man.fly = true;
      if(_parent._x < _parent._parent.man._x)
      {
         _parent._parent.man.ff = 1;
      }
      else
      {
         _parent._parent.man.ff = 0;
      }
      _parent._parent.man.long = 8;
      _parent._parent.man.gotoAndPlay("倒");
      _root.hit_q3.start();
      _root.hit_z3.start();
      _root.hp -= _parent.atk + 4;
   }
   else
   {
      if(_parent.f == 1)
      {
         _parent._x -= 20;
      }
      if(_parent.f == 0)
      {
         _parent._x += 20;
      }
   }
}
