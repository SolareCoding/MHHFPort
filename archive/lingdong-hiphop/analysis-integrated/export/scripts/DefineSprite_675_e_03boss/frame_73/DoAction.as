stop();
if(hp <= 0)
{
   aa = random(3);
   if(aa == 0)
   {
      _root.enemyLoad("item_p",_X,_Y);
   }
   if(aa == 1)
   {
      _root.enemyLoad("item_exp",_X,_Y);
   }
}
