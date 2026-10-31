onClipEvent(enterFrame){
   if(_parent.fly == true)
   {
      if(_parent.ff == 0 && _parent._x > _root.sx)
      {
         _parent._x -= _parent.long;
      }
      else if(_parent.ff == 1 && _parent._x < _root.smx)
      {
         _parent._x += _parent.long;
      }
   }
   else
   {
      atkFly();
   }
}
