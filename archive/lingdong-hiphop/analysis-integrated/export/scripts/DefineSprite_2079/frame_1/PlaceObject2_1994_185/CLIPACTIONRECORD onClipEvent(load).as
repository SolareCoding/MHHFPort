onClipEvent(load){
   function ziti(obj, oldval, newval)
   {
      if(newval > 99)
      {
         num3.gotoAndStop(int(newval / 100) % 10 + 1);
      }
      else
      {
         num3.gotoAndStop(11);
      }
      if(newval > 9)
      {
         num2.gotoAndStop(int(newval / 10) % 10 + 1);
      }
      else
      {
         num2.gotoAndStop(11);
      }
      num1.gotoAndStop(newval % 10 + 1);
      return newval;
   }
   _root.watch("bairen",ziti);
   ziti(null,null,_root.bairen);
}
