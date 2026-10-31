onClipEvent(keyDown){
   a = _root.vol;
   if(Key.isDown(65) || Key.isDown(37))
   {
      if(_root.vol > 30)
      {
         _root.select.start();
         _root.vol -= 10;
      }
   }
   if(Key.isDown(68) || Key.isDown(39))
   {
      if(_root.vol < 100)
      {
         _root.select.start();
         _root.vol += 10;
      }
   }
}
