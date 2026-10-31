onClipEvent(load){
   function ziti(obj, oldval, newval)
   {
      if(newval > 9)
      {
         nu2.gotoAndStop(int(newval / 10) % 10 + 1);
      }
      else
      {
         nu2.gotoAndStop(11);
      }
      nu1.gotoAndStop(newval % 10 + 1);
      return newval;
   }
   _root.watch("Time",ziti);
   ziti(null,null,_root.Time);
}
