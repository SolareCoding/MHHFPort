function talk()
{
   bb = random(4);
   if(bb == 0)
   {
      _root.redboss_g1.start();
   }
   if(bb == 1)
   {
      _root.redboss_g2.start();
   }
   if(bb == 2)
   {
      _root.redboss_g3.start();
   }
}
function adtalk()
{
   bb = random(2);
   if(bb == 0)
   {
      _root.redboss_a1.start();
   }
   if(bb == 1)
   {
      _root.redboss_a2.start();
   }
}
stop();
_name = "boss";
myname = _name;
_root.game.zhuang.boss1.name = "红蜘蛛";
_root.game.zhuang.boss1.gotoAndStop(2);
_root.diren++;
_root.bos++;
_alpha = 0;
_width = 70;
_height = 113;
cc = _xscale;
f = 1;
if(_root.hard == 0)
{
   hp = maxhp = 4000;
   speed = 4;
   atk = 20;
   Hit = 10;
   phit = 6;
   retort = 30;
}
else
{
   hp = maxhp = 6000;
   speed = 4;
   atk = 30;
   Hit = 10;
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
