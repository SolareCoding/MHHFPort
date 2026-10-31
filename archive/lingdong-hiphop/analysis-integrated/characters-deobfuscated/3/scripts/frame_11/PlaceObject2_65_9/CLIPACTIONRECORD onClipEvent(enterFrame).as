onClipEvent(enterFrame){
   if(_root.jumpStay == true)
   {
      _root.lwalk = 0;
      _root.rwalk = 0;
   }
   if(_root.jumpStay == false)
   {
      with(_parent)
      {
         jumpLong = 80;
         yinc += g;
         _y += yinc;
         if(_y >= ldd)
         {
            _root.lwalk = 0;
            _root.rwalk = 0;
            var inair = false;
            var yinc = 0;
            _y = ldd;
            _root.ld.start();
            huifu();
            _parent.yinyin.removeMovieClip();
            gotoAndStop("站");
         }
         if(startJump == 1 && _x > _root.sx && f == 1 && _root.pause == 0)
         {
            if(walk == 2)
            {
               if(_x > _x - (jumpLong + 0))
               {
                  if(_root.diren <= 0 && _x <= _root.smx / 2 && _parent.bj1._x < _parent.bj1.xmin)
                  {
                     _root.lwalk = 2;
                     _parent.bj1._x += speed * 2;
                     _parent.qj1._x += speed * 3;
                  }
                  else
                  {
                     _root.lwalk = 0;
                     _x -= speed * 2;
                  }
               }
            }
            else if(_x > _x - jumpLong)
            {
               if(_root.diren <= 0 && _x <= _root.smx / 2 && _parent.bj1._x < _parent.bj1.xmin)
               {
                  _root.lwalk = 1;
                  _parent.bj1._x += speed;
                  _parent.qj1._x += speed + 3;
               }
               else
               {
                  _root.lwalk = 0;
                  _x -= speed;
               }
            }
            _xscale = - cc;
         }
         if(startJump == 2 && _x < _root.smx && f == 0 && _root.pause == 0)
         {
            if(walk == 2)
            {
               if(_x < _x + (jumpLong + 20))
               {
                  if(_root.diren <= 0 && _x >= _root.smx / 2 && _parent.bj1._x > _parent.bj1.xmax)
                  {
                     _root.rwalk = 2;
                     _parent.bj1._x -= speed * 2;
                     _parent.qj1._x -= speed * 3;
                  }
                  else
                  {
                     _root.rwalk = 0;
                     _x += speed * 2;
                  }
               }
            }
            else if(_x < _x + jumpLong)
            {
               if(_root.diren <= 0 && _x >= _root.smx / 2 && _parent.bj1._x > _parent.bj1.xmax)
               {
                  _root.rwalk = 1;
                  _parent.bj1._x -= speed;
                  _parent.qj1._x -= speed + 3;
               }
               else
               {
                  _root.rwalk = 0;
                  _x += speed;
               }
            }
            _xscale = cc;
         }
         if(Key.isDown(_root.up) && ldd > _root.sy && _root.pause == 0)
         {
            if(walk == 2)
            {
               ldd -= speed - 2;
               _y -= speed - 2;
            }
            else
            {
               ldd -= speed / 2;
               _y -= speed / 2;
            }
         }
         if(Key.isDown(_root.down) && ldd < _root.smy && _root.pause == 0)
         {
            if(walk == 2)
            {
               ldd += speed - 2;
               _y += speed - 2;
            }
            else
            {
               ldd += speed / 2;
               _y += speed / 2;
            }
         }
      }
   }
}
