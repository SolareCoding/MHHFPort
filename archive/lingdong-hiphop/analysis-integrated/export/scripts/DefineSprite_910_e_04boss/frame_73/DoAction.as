stop();
if(hp <= 0)
{
   aa = random(2);
   if(aa == 1)
   {
      _root.enemyLoad("item_exp",_X,_Y);
   }
   if(aa == 0)
   {
      _root.enemyLoad("item_1up",_X,_Y);
   }
}
