onClipEvent(load){
   function combo()
   {
      combomc = _root.game.zhuang.combomc;
      _root.combo = _root.combo + 1;
      if(_root.combo >= 3)
      {
         combomc._x = _parent._x;
         combomc._y = _parent._y - 70;
         combomc.gotoAndPlay(2);
      }
   }
   function atkFly(long)
   {
      if(man.f == 0 && _parent._x < _root.smx)
      {
         _parent._x += long;
      }
      else if(_parent._x > _root.sx)
      {
         _parent._x -= long;
      }
   }
   man = _parent._parent.man;
   long = _parent._parent.firedrong;
}
