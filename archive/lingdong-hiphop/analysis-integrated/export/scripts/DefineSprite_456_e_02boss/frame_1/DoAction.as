function talk()
{
   bb = random(4);
   if(bb == 0)
   {
      _root.e_2b1.start();
   }
   if(bb == 1)
   {
      _root.e_2b2.start();
   }
   if(bb == 2)
   {
      _root.e_2b3.start();
   }
}
function adtalk()
{
   bb = random(2);
   if(bb == 0)
   {
      _root.e_2bad.start();
   }
   if(bb == 1)
   {
      _root.e_2bad2.start();
   }
}
stop();
_name = "boss";
myname = _name;
_root.game.zhuang.boss1.name = "公子";
_root.game.zhuang.boss1.gotoAndStop(2);
_root.diren++;
_root.bos++;
_alpha = 0;
_width = 89;
_height = 121.5;
cc = _xscale;
f = 1;
if(_root.hard == 0)
{
   hp = maxhp = 1500;
   speed = 3;
   atk = 20;
   Hit = 20;
   phit = 6;
   retort = 40;
}
else
{
   hp = maxhp = 2000;
   speed = 3;
   atk = 25;
   Hit = 15;
   phit = 5;
   retort = 20;
}
this.onEnterFrame = function()
{
   this.swapDepths(100000 + _Y * 100 + id % 100);
   if(hp >= maxhp)
   {
      hp = maxhp;
   }
   if(hp <= 0)
   {
      hp = 0;
   }
};
