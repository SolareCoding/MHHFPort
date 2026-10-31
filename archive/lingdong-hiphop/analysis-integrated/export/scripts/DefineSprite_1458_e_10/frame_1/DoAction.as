stop();
myname = _name;
_alpha = 0;
_width = 114.8;
_height = 118.6;
cc = _xscale;
_root.diren++;
f = 1;
if(_root.hard == 0)
{
   hp = maxhp = 350;
   speed = 3;
   atk = 25;
   Hit = 35;
   phit = 10;
   retort = 100;
}
else
{
   hp = maxhp = 500;
   speed = 3;
   atk = 25;
   Hit = 30;
   phit = 8;
   retort = 50;
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
