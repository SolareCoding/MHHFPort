stop();
_root.diren++;
myname = _name;
_alpha = 0;
_width = 84.6;
_height = 97.5;
cc = _xscale;
wz = random(2);
if(wz == 0)
{
   _X = -100;
}
else
{
   _X = 500;
}
f = 1;
if(_root.hard == 0)
{
   hp = maxhp = 170;
   speed = 4;
   atk = 15;
   Hit = 35;
   retort = 100;
}
else
{
   hp = maxhp = 220;
   speed = 4;
   atk = 18;
   Hit = 25;
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
