onClipEvent(load){
   if(_root.hard == 0)
   {
      maxenemy = 15;
      nowenemy = 5;
   }
   else
   {
      maxenemy = 15;
      nowenemy = 7;
   }
   _root.enemyLoad("item_boxsmall",700,_root.sy + 20);
   _root.enemyLoad("item_boxbig",760,_root.sy + 10);
}
