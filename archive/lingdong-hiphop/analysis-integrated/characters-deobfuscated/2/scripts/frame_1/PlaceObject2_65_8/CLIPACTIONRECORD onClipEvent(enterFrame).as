onClipEvent(enterFrame){
   if(_root.pause == 0)
   {
      with(_parent)
      {
         if(Key.isDown(_root.left) && _x > _root.sx && _root.dong == 0)
         {
            gotoAndPlay("走");
            f = 1;
            if(_root.diren <= 0 && _x <= _root.smx / 2 && _parent.bj1._x < _parent.bj1.xmin)
            {
               _x -= 0;
               _parent.bj1._x += speed;
               _parent.qj1._x += speed + 3;
               _root.lwalk = 1;
            }
            else
            {
               _root.lwalk = 0;
               _x -= speed;
            }
            _xscale = - cc;
         }
         else
         {
            _root.lwalk = 0;
         }
         if(Key.isDown(_root.right) && _x < _root.smx && _root.dong == 0)
         {
            gotoAndPlay("走");
            f = 0;
            if(_root.diren <= 0 && _x >= _root.smx / 2 && _parent.bj1._x > _parent.bj1.xmax)
            {
               _x += 0;
               _parent.bj1._x -= speed;
               _parent.qj1._x -= speed + 3;
               _root.rwalk = 1;
            }
            else
            {
               _root.rwalk = 0;
               _x += speed;
            }
            _xscale = cc;
         }
         else
         {
            _root.rwalk = 0;
         }
         if(Key.isDown(_root.up) && _y > _root.sy && _root.dong == 0)
         {
            gotoAndPlay("走");
            _y -= speed / 2;
         }
         if(Key.isDown(_root.down) && _y < _root.smy && _root.dong == 0)
         {
            gotoAndPlay("走");
            _y += speed / 2;
         }
         if(Key.isDown(_root.atk) && _root.atkpress == 0 && Key.isDown(_root.left) && _root.lpress == 0 && _root.dong == 0)
         {
            gotoAndPlay("特殊技");
         }
         if(Key.isDown(_root.atk) && _root.atkpress == 0 && Key.isDown(_root.right) && _root.rpress == 0)
         {
            gotoAndPlay("特殊技");
         }
         if(Key.isDown(_root.atk) && _root.atkpress == 0 && Key.isDown(_root.jump) && _root.jumppress == 0 && _root.hp > 10)
         {
            _root.hp -= 10;
            gotoAndPlay("保护");
         }
         else if(Key.isDown(_root.atk) && _root.atkpress == 0 && _root.dong == 0)
         {
            if(hitLeave == 0)
            {
               _root.keyBack();
               gotoAndPlay("攻击1");
            }
            if(hitLeave == 1)
            {
               _root.keyBack();
               gotoAndPlay("攻击2");
            }
            if(hitLeave == 2)
            {
               _root.keyBack();
               gotoAndPlay("攻击3");
            }
         }
         if(Key.isDown(_root.jump) && _root.jumppress == 0)
         {
            if(Key.isDown(_root.left))
            {
               startJump = 1;
            }
            else if(Key.isDown(_root.right))
            {
               startJump = 2;
            }
            else
            {
               startJump = 0;
            }
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
}
