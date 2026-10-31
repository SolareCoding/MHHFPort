onClipEvent(enterFrame){
   if(_root.pause == 0)
   {
      with(_parent)
      {
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
      if(_parent.take == false)
      {
         _parent.gotoAndPlay("站");
      }
      if(Key.isDown(_root.atk) && _root.atkpress == 0 && _parent.take == true)
      {
         if(Key.isDown(_root.left) || Key.isDown(_root.right))
         {
            _parent.gotoAndPlay("扔");
         }
         else
         {
            _parent.gotoAndPlay("头击");
         }
      }
      with(_parent)
      {
         if(Key.isDown(_root.left))
         {
            _xscale = - cc;
            f = 1;
         }
         if(Key.isDown(_root.right))
         {
            _xscale = cc;
            f = 0;
         }
      }
   }
}
