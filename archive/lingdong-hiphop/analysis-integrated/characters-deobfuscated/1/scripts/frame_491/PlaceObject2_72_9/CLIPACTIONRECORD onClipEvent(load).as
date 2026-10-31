onClipEvent(load){
   function atkFly()
   {
      if(_parent.f == 0 && _parent._x > _root.sx)
      {
         _parent._x -= 5;
      }
      else if(_parent._x < _root.smx)
      {
         _parent._x += 5;
      }
   }
}
