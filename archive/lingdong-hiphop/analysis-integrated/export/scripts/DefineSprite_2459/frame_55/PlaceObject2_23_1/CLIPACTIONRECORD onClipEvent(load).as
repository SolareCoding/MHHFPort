onClipEvent(load){
   if(_root.hard == 0)
   {
      maxenemy = 8;
      nowenemy = 5;
   }
   else
   {
      maxenemy = 12;
      nowenemy = 6;
   }
   _root.enemyLoad("item_mt",760,_root.sy + 70);
}
