onClipEvent(enterFrame){
   if(_parent.hitting == 1)
   {
      if(Key.isDown(_root.left))
      {
         _root.ll = 1;
      }
      else
      {
         _root.ll = 0;
      }
      if(Key.isDown(_root.right))
      {
         _root.rr = 1;
      }
      else
      {
         _root.rr = 0;
      }
      if(Key.isDown(_root.up))
      {
         _root.uu = 1;
      }
      else
      {
         _root.uu = 0;
      }
      if(Key.isDown(_root.down))
      {
         _root.dd = 1;
      }
      else
      {
         _root.dd = 0;
      }
      if(Key.isDown(_root.atk))
      {
         _root.gg = 1;
      }
      else
      {
         _root.gg = 0;
      }
   }
}
