onClipEvent(enterFrame){
   with(_parent)
   {
      if(Key.isDown(_root.atk) && _root.atkpress == 0 && Key.isDown(_root.down))
      {
         gotoAndPlay("特殊技");
      }
      else if(Key.isDown(_root.atk) && _root.atkpress == 0)
      {
         if(hitLeave == 0)
         {
            gotoAndPlay("攻击1");
         }
         if(hitLeave == 1)
         {
            gotoAndPlay("攻击2");
         }
         if(hitLeave == 2)
         {
            gotoAndPlay("攻击3");
         }
      }
   }
}
