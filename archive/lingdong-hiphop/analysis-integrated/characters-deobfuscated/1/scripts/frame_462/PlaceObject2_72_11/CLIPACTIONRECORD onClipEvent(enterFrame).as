onClipEvent(enterFrame){
   with(_parent)
   {
      if(Key.isDown(_root.atk) && _root.atkpress == 0 && Key.isDown(_root.jump) && _root.jumppress == 0 && _root.hp > 10)
      {
         _root.hp -= 10;
         gotoAndPlay("保护");
      }
   }
}
