onClipEvent(load){
   function atkFly(long)
   {
      if(_parent.ff == 0 && _parent._x > _root.sx)
      {
         _parent._x -= long;
      }
      else if(_parent._x < _root.smx)
      {
         _parent._x += long;
      }
   }
   man = _parent._parent.man;
   long = _parent._parent.firedrong;
}
