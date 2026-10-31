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
         if(randomWalk < 10)
         {
            if(_x < _parent.man._x)
            {
               if(_x < _parent.man._x - 30 && _x < _root.smx)
               {
                  _x += speed * 2;
               }
               if(_x > _parent.man._x - 30 && _x > _root.sx)
               {
                  _x -= speed * 2;
               }
            }
            if(_x > _parent.man._x)
            {
               if(_x > _parent.man._x + 30 && _x > _root.sx)
               {
                  _x -= speed * 2;
               }
               if(_x < _parent.man._x + 30 && _x < _root.smx)
               {
                  _x += speed * 2;
               }
            }
            if(_y < _parent.man._y && _y < _root.smy)
            {
               _y += speed;
            }
            if(_y > _parent.man._y && _y > _root.sy)
            {
               _y -= speed;
            }
         }
         else
         {
            if(_x < randomStayX)
            {
               _x += speed;
            }
            if(_x > randomStayX)
            {
               _x -= speed;
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
      aa = random(_parent.Hit);
      if(aa < 4)
      {
         _parent.gotoAndPlay("冲斩");
      }
      else
      {
         _parent.gotoAndStop("站");
      }
   }
}
