onClipEvent(enterFrame){
   if(_root.pause == 0)
   {
      if(Key.isDown(_root.atk) && _root.atkpress == 0 && Key.isDown(_root.jump) && _root.jumppress == 0 && _root.hp > 10)
      {
         _root.hp -= 10;
         _parent.gotoAndPlay("保护");
      }
      if(Key.isDown(_root.left) && _parent._x > _root.sx)
      {
         with(_parent)
         {
            _xscale = - cc;
            f = 1;
            if(_root.diren <= 0 && _x <= _root.smx / 2 && _parent.bj1._x < _parent.bj1.xmin)
            {
               _x -= 0;
               _parent.bj1._x += speed * 2;
               _parent.qj1._x += speed * 3;
               _root.lwalk = 2;
            }
            else
            {
               _root.lwalk = 0;
               _x -= speed * 2;
            }
         }
      }
      else
      {
         _root.lwalk = 0;
         _parent.gotoAndPlay("站");
      }
      if(Key.isDown(_root.up) && _parent._y > _root.sy)
      {
         with(_parent)
         {
            _y -= speed * 2 / 2;
         }
      }
      if(Key.isDown(_root.down) && _parent._y < _root.smy)
      {
         with(_parent)
         {
            _y += speed * 2 / 2;
         }
      }
      if(Key.isDown(_root.atk) && _root.atkpress == 0 && _root.mp >= _root.b_cz)
      {
         with(_parent)
         {
            gotoAndPlay("冲击");
         }
      }
      else if(Key.isDown(_root.atk) && _root.atkpress == 0)
      {
         _parent.gotoAndPlay("攻击1");
      }
      with(_parent)
      {
         if(Key.isDown(_root.jump) && _root.jumppress == 0)
         {
            startJump = 1;
            _parent.attachMovie("yinyin","yinyin",_y - 1);
            _parent.yinyin._x = _x;
            _parent.yinyin._y = _y - 1;
            _parent.yinyin.id = 2;
            inair = true;
            ldd = _y;
            yinc = jumpspeed;
            _root.tiao.start();
            gotoAndStop("跳");
         }
      }
   }
   else
   {
      _parent.gotoAndStop("站");
   }
}
