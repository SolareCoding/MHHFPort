onClipEvent(load){
   function ziti(obj, oldval, newval)
   {
      nu1.gotoAndStop(newval % 10 + 1);
      return newval;
   }
   _root.watch("lv_a",ziti);
   ziti(null,null,_root.lv_a);
}
