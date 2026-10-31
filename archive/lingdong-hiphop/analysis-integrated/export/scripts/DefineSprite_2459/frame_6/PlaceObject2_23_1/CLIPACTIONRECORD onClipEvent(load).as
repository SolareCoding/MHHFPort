onClipEvent(load){
   if(_root.hard == 0)
   {
      maxenemy = 5;
      nowenemy = 4;
   }
   else
   {
      maxenemy = 8;
      nowenemy = 5;
   }
   _root.enemyLoad("item_boxsmall",690,random(_root.syy) + _root.sy);
   _root.enemyLoad("item_boxsmall",650,random(_root.syy) + _root.sy);
}
