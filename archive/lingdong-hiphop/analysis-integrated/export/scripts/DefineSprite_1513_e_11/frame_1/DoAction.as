stop();
myname = _name;
_alpha = 0;
_width = 75.1;
_height = 113.5;
cc = _xscale;
_root.diren++;
f = 1;
_root.x_slchu.start();
if(_root.hard == 0)
{
   hp = maxhp = 220;
   speed = 4;
   atk = 15;
   Hit = 35;
   phit = 8;
   retort = 100;
}
else
{
   hp = maxhp = 250;
   speed = 4;
   atk = 18;
   Hit = 30;
   phit = 5;
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
