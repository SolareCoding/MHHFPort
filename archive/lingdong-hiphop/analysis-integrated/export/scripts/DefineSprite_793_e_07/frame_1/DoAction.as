stop();
_root.diren++;
myname = _name;
_alpha = 0;
_width = 109.5;
_height = 112;
cc = _xscale;
wz = random(2);
if(wz == 0)
{
   _X = -20;
}
else
{
   _X = 420;
}
f = 1;
if(_root.hard == 0)
{
   hp = maxhp = 120;
   speed = 3;
   atk = 8;
   Hit = 50;
   phit = 10;
   retort = 100;
}
else
{
   hp = maxhp = 150;
   speed = 3;
   atk = 12;
   Hit = 30;
   phit = 7;
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
