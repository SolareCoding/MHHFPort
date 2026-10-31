function talk()
{
   bb = random(3);
   if(bb == 0)
   {
      _root.dlboss_g1.start();
   }
   if(bb == 1)
   {
      _root.dlboss_g2.start();
   }
}
function adtalk()
{
   bb = random(2);
   if(bb == 0)
   {
      _root.dlboss_a1.start();
   }
   if(bb == 1)
   {
      _root.dlboss_a2.start();
   }
}
stop();
_name = "boss";
myname = _name;
_root.game.zhuang.boss1.name = "牢狱长";
_root.game.zhuang.boss1.gotoAndStop(2);
_root.diren++;
_root.bos++;
_alpha = 0;
_width = 135.9;
_height = 185.1;
cc = _xscale;
f = 1;
if(_root.hard == 0)
{
   hp = maxhp = 3000;
   speed = 3;
   atk = 30;
   Hit = 15;
   phit = 6;
   retort = 30;
}
else
{
   hp = maxhp = 3200;
   speed = 3;
   atk = 35;
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
