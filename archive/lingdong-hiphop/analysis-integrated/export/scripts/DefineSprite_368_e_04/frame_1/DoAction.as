stop();
_root.diren++;
myname = _name;
_alpha = 0;
_width = 94.4;
_height = 82.2;
cc = _xscale;
f = 1;
if(_root.hard == 0)
{
   hp = maxhp = 120;
   speed = 4;
   atk = 10;
   Hit = 40;
   retort = 100;
}
else
{
   hp = maxhp = 150;
   speed = 4;
   atk = 13;
   Hit = 30;
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
