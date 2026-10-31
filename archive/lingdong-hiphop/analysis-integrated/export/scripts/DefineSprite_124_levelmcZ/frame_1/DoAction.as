_alpha = 100;
_width = 31.4;
_height = 28.5;
this.onEnterFrame = function()
{
   _rotation = _rotation + 10;
   if(_alpha > 30)
   {
      _alpha = _alpha - 2;
   }
   if(_X > _parent.man._x - 20)
   {
      _X = _X - Math.abs(_X - _parent.man._x) / 10;
   }
   if(_X < _parent.man._x - 20)
   {
      _X = _X + Math.abs(_X - _parent.man._x) / 10;
   }
   if(_Y > _parent.man._y - 20)
   {
      _Y = _Y - Math.abs(_Y - _parent.man._y) / 10;
   }
   if(_Y < _parent.man._y - 20)
   {
      _Y = _Y + Math.abs(_Y - _parent.man._y) / 10;
   }
   if(hitTest(_parent.man.shiti))
   {
      this.removeMovieClip();
   }
   else if(!hitTest(_parent.man))
   {
      _root.enemyLoad("levelmc",_X,_Y);
   }
};
