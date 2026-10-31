onClipEvent(load){
   function ziti(obj, oldval, newval)
   {
      if(newval > 9999999)
      {
         num8.gotoAndStop(int(newval / 10000000) % 10 + 1);
      }
      else
      {
         num8.gotoAndStop(11);
      }
      if(newval > 999999)
      {
         num7.gotoAndStop(int(newval / 1000000) % 10 + 1);
      }
      else
      {
         num7.gotoAndStop(11);
      }
      if(newval > 99999)
      {
         num6.gotoAndStop(int(newval / 100000) % 10 + 1);
      }
      else
      {
         num6.gotoAndStop(11);
      }
      if(newval > 9999)
      {
         num5.gotoAndStop(int(newval / 10000) % 10 + 1);
      }
      else
      {
         num5.gotoAndStop(11);
      }
      if(newval > 999)
      {
         num4.gotoAndStop(int(newval / 1000) % 10 + 1);
      }
      else
      {
         num4.gotoAndStop(11);
      }
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
   _parent._parent.watch("s2",ziti);
   ziti(null,null,_parent._parent.s2);
}
