_width = 60.3;
_height = 72.2;
hp = 10;
this.onEnterFrame = function()
{
   this.swapDepths(100000 + _Y * 100 + id % 100);
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
