onClipEvent(enterFrame){
   if(Key.isDown(_root.down) && Key.isDown(_root.atk) && _root.atkpress == 0)
   {
      _parent.gotoAndPlay("飞空2");
   }
}
