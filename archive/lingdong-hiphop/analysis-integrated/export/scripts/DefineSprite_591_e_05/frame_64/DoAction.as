stop();
if(hp <= 0)
{
   aa = random(_root.itemshow);
   if(aa == 0)
   {
      _root.enemyLoad("item_s",_X,_Y);
   }
   if(aa == 1)
   {
      _root.enemyLoad("item_p",_X,_Y);
   }
}
