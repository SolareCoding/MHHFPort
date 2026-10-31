stop();
if(hp <= 0)
{
   _root.sl_a3.start();
   aa = random(_root.itemshow);
   if(aa == 0)
   {
      _root.enemyLoad("item_s",_X,_Y);
   }
}
