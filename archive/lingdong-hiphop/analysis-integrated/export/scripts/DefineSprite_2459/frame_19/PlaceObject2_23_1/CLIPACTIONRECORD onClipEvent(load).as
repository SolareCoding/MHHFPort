onClipEvent(load){
   if(_root.hard == 0)
   {
      maxenemy = 7;
      nowenemy = 5;
   }
   else
   {
      maxenemy = 8;
      nowenemy = 6;
   }
   _root.enemyLoad("item_boxsmall",470,random(_root.syy) + _root.sy);
   _root.enemyLoad("item_boxsmall",500,random(_root.syy) + _root.sy);
}
