stop();
_name = "boss";
myname = _name;
_root.game.zhuang.boss1.name = "无名";
_root.game.zhuang.boss1.gotoAndStop(2);
_root.diren++;
_root.bos++;
_alpha = 0;
_width = 112.3;
_height = 128.9;
cc = _xscale;
f = 1;
if(_root.hard == 0)
{
   hp = maxhp = 800;
   speed = 3;
   atk = 15;
   Hit = 15;
   phit = 5;
   retort = 40;
}
else
{
   hp = maxhp = 1000;
   speed = 3;
   atk = 20;
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
