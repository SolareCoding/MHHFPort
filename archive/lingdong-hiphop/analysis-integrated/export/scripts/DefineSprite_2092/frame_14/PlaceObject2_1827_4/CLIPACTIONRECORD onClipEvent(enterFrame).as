onClipEvent(enterFrame){
   if(Key.isDown(_root.atk) && _root.atkpress == 0 && _parent._alpha >= 100)
   {
      _root.x_btn.start(0.1);
      _root.select.start();
      _parent.play();
   }
}
