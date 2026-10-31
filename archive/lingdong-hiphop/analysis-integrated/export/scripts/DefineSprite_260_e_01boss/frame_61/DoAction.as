stop();
if(_root.Time >= 65 && hp <= 0)
{
   _root.enemyLoad("item_szkj",_X,_Y);
}
else if(hp <= 0)
{
   _root.enemyLoad("item_bxj",_X,_Y);
}
