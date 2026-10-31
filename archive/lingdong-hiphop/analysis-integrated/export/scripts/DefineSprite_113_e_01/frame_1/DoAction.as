stop();
_root.diren++;
myname = _name;
_alpha = 0;
_width = 65.1;
_height = 92.3;
cc = _xscale;
f = 0;
if(_root.hard == 0)
{
   hp = maxhp = 100;
   speed = 3;
   atk = 5;
   Hit = 40;
   phit = 10;
   retort = 100;
}
else
{
   hp = maxhp = 100;
   speed = 3;
   atk = 10;
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
