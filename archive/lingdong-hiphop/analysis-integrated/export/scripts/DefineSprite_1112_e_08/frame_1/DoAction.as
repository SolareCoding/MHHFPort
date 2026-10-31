stop();
myname = _name;
_alpha = 0;
_width = 65;
_height = 110.6;
cc = _xscale;
_root.silin++;
f = 1;
_root.x_slchu.start();
if(_root.hard == 0)
{
   hp = maxhp = 150;
   speed = 4;
   atk = 15;
   Hit = 40;
   phit = 10;
   retort = 100;
}
else
{
   hp = maxhp = 150;
   speed = 3;
   atk = 18;
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
