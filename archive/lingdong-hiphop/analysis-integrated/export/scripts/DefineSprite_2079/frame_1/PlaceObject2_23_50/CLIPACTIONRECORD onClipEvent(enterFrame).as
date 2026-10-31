onClipEvent(enterFrame){
   if(_root.without == 1)
   {
      _parent._parent.man._alpha = 50;
      if(i > 0)
      {
         i--;
      }
      else
      {
         _parent._parent.man._alpha = 100;
         _root.without = 0;
         i = 100;
      }
   }
}
