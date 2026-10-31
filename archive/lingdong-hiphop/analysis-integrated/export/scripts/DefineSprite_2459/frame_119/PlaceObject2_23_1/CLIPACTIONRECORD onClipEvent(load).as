onClipEvent(load){
   maxenemy = 12;
   if(_root.sowrd == 4 || _root.sowrd == 5)
   {
      nowenemy = 5;
   }
   else
   {
      nowenemy = 5;
   }
   _root.enemyLoad("item_mt",760,_root.sy + 70);
   _root.enemyLoad("item_boxsmall",150,random(_root.syy) + _root.sy);
}
