onClipEvent(enterFrame){
   if(hitTest(_parent._parent.man.shiti) && !_parent._parent.man.inair && _root.without == 0 && aa == 0)
   {
      aa = 1;
      _parent.stop();
      _parent.free.gotoAndPlay(2);
      _parent._parent.man.atkS = 0;
      _parent._parent.man.fly = true;
      if(_parent._x < _parent._parent.man._x)
      {
         _parent._parent.man.ff = 1;
      }
      else
      {
         _parent._parent.man.ff = 0;
      }
      _parent._parent.man.long = 3;
      _parent._parent.man.gotoAndPlay("挨打");
      _root.hit_zs.start();
      _root.hp -= _parent.atk;
   }
}
