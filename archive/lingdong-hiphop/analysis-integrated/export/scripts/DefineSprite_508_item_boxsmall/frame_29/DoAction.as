stop();
bbb = random(20);
if(bbb == 0)
{
   _root.enemyLoad("item_exp",_X,_Y);
}
else
{
   aaa = random(3);
   if(aaa > 1)
   {
      _root.enemyLoad("item_s",_X,_Y);
   }
   if(aaa == 0)
   {
      _root.enemyLoad("item_p",_X,_Y);
   }
   if(aaa == 1)
   {
      _root.enemyLoad("item_jt",_X,_Y);
   }
}
