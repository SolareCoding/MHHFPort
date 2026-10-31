stop();
myname = _name;
_alpha = 0;
_width = 62.9;
_height = 112.4;
cc = _xscale;
_root.silin++;
f = 1;
_root.x_slchu.start();
if(_root.hard == 0)
{
   hp = maxhp = 130;
   speed = 5;
   atk = 10;
   Hit = 30;
   phit = 10;
   retort = 100;
}
else
{
   hp = maxhp = 130;
   speed = 3;
   atk = 15;
   Hit = 25;
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
   if(_root.itemdel == 1)
   {
      this.removeMovieClip();
   }
   if(_root.rwalk == 1)
   {
      _X = _X - _parent.man.speed;
   }
   if(_root.rwalk == 2)
   {
      _X = _X - _parent.man.speed * 2;
   }
   if(_root.lwalk == 1)
   {
      _X = _X + _parent.man.speed;
   }
   if(_root.lwalk == 2)
   {
      _X = _X + _parent.man.speed * 2;
   }
};
