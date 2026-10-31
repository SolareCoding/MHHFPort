stop();
_root.diren++;
myname = _name;
_alpha = 0;
_width = 72.8;
_height = 80.3;
cc = _xscale;
f = 1;
if(_root.hard == 0)
{
   hp = maxhp = 120;
   speed = 3;
   atk = 8;
   Hit = 40;
   phit = 10;
   retort = 100;
}
else
{
   hp = maxhp = 140;
   speed = 3;
   atk = 14;
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
