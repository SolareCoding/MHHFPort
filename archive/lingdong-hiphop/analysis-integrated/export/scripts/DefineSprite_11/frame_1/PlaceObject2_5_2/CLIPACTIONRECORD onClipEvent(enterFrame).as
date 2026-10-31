onClipEvent(enterFrame){
   bload = _root.getBytesLoaded();
   percent_load = Math.round(bload / btotal * 10000) / 100;
   _xscale = percent_load;
   _parent.kb = percent_load;
   if(percent_load >= 100)
   {
      with(_root)
      {
         play();
      }
   }
}
