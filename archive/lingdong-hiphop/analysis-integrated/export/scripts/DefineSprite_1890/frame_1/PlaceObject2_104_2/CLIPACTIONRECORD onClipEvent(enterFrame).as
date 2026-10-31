onClipEvent(enterFrame){
   aa = int(_root.mp / _root.maxmp * 100);
   if(_xscale < aa)
   {
      _xscale++;
   }
   if(_xscale > aa)
   {
      _xscale--;
   }
   if(_root.mp >= _root.maxmp)
   {
      _xscale = 100;
   }
}
