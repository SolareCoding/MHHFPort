onClipEvent(enterFrame){
   if(_root.pause == 0)
   {
      if(i > 0)
      {
         i--;
      }
      else
      {
         i = _root.mpSpeed;
         _root.mp++;
      }
      if(_root.mp <= 0)
      {
         _root.mp = 0;
      }
      if(_root.mp >= _root.maxmp)
      {
         _root.mp = _root.maxmp;
      }
      _xscale = int(_root.mp / _root.maxmp * 100);
   }
}
