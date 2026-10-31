function talk()
{
   bb = random(3);
   if(bb == 0)
   {
      _root.hxboss_g1.start();
   }
   if(bb == 1)
   {
      _root.hxboss_g2.start();
   }
}
function adtalk()
{
   bb = random(2);
   if(bb == 0)
   {
      _root.hxboss_a1.start();
   }
   if(bb == 1)
   {
      _root.hxboss_a2.start();
   }
}
stop();
_name = "boss";
myname = _name;
_root.game.zhuang.boss1.name = "黑心";
_root.game.zhuang.boss1.gotoAndStop(2);
_root.diren++;
_root.bos++;
_alpha = 0;
_width = 116;
_height = 113;
cc = _xscale;
f = 1;
if(_root.hard == 0)
{
   hp = maxhp = 3000;
   speed = 4;
   atk = 30;
   Hit = 10;
   phit = 6;
   retort = 30;
}
else
{
   hp = maxhp = 4000;
   speed = 4;
   atk = 35;
   Hit = 10;
   phit = 5;
   retort = 25;
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
