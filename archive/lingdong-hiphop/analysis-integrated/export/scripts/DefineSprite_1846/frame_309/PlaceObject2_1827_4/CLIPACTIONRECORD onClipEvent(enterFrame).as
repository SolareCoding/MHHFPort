onClipEvent(enterFrame){
   if(Key.isDown(_root.atk) && _root.atkpress == 0)
   {
      _root.x_btn.start(0.1);
      _parent.play();
   }
}
