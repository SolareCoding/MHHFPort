stop();
if(qk == 1)
{
   _root.conceal_21 = 1;
   _root.enemyLoad("item_boxbx",_X,_Y);
   _root.enemyLoad("as_1",460,-50);
}
if(qk == 2)
{
   _root.conceal_21 = 2;
   _root.enemyLoad("item_boxbx",_X,_Y);
   _root.enemyLoad("as_1",460,-50);
}
if(qk == 0)
{
   _root.bgm("废墟");
   trace("百人斩");
   _root.conceal_21 = 0;
   _root.enemyLoad("as_no",460,-50);
}
this.removeMovieClip();
