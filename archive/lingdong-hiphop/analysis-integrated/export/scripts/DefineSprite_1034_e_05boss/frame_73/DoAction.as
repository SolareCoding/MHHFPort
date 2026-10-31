stop();
if(hp <= 0)
{
   if(_root.conceal_21 == 1 || _root.conceal_21 == 2 || _root.conceal_21 == 3)
   {
      _root.enemyLoad("item_ylmj",_X,_Y);
   }
   aa = random(3);
   if(aa == 0)
   {
      _root.enemyLoad("item_s",_X,_Y);
   }
   if(aa == 1)
   {
      _root.enemyLoad("item_exp",_X,_Y);
   }
}
