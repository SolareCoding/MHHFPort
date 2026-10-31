stop();
_root.diren++;
myname = _name;
_alpha = 0;
_width = 66.2;
_height = 92;
cc = _xscale;
f = 1;
if(_root.hard == 0)
{
   hp = maxhp = 150;
   speed = 3;
   atk = 12;
   Hit = 40;
   phit = 10;
   retort = 100;
}
else
{
   hp = maxhp = 180;
   speed = 3;
   atk = 15;
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
