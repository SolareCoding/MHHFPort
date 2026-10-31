onClipEvent(enterFrame){
   if(Key.isDown(77) && Key.isDown(85))
   {
      i++;
      if(_root.life != 10 && i > 200)
      {
         _root.x_bd.start();
         _root.life = 10;
         _parent.play();
      }
   }
   else
   {
      i = 0;
   }
}
