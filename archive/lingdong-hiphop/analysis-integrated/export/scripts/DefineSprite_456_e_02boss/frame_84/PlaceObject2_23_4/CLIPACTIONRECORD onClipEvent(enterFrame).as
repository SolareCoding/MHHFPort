onClipEvent(enterFrame){
   with(_parent)
   {
      if(_x < _parent.man._x)
      {
         _xscale = - cc;
         f = 0;
      }
      else
      {
         _xscale = cc;
         f = 1;
      }
   }
   if(walkTime > 0)
   {
      walkTime--;
      with(_parent)
      {
         if(randomWalk < 1)
         {
            if(_x < _parent.man._x)
            {
               if(_x < _parent.man._x - 30)
               {
                  _x += speed * 4;
               }
               if(_x > _parent.man._x - 30)
               {
                  _x -= speed * 4;
               }
            }
            if(_x > _parent.man._x)
            {
               if(_x > _parent.man._x + 30)
               {
                  _x -= speed * 4;
               }
               if(_x < _parent.man._x + 30)
               {
                  _x += speed * 4;
               }
            }
            if(_y < _parent.man._y)
            {
               _y += speed * 2;
            }
            if(_y > _parent.man._y)
            {
               _y -= speed * 2;
            }
         }
         else
         {
            if(_x < randomStayX)
            {
               _x += speed * 4;
            }
            if(_x > randomStayX)
            {
               _x -= speed * 4;
            }
            if(_y < randomStayY)
            {
               _y += speed / 2;
            }
            if(_y > randomStayY)
            {
               _y -= speed / 2;
            }
         }
      }
   }
   else
   {
      aa = random(2);
      if(aa == 0)
      {
         _parent.gotoAndPlay("攻击");
      }
      if(aa == 1)
      {
         _parent.gotoAndPlay("防2");
      }
   }
}
