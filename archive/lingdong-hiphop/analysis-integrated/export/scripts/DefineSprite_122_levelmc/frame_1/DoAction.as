_alpha = 100;
_width = 70;
_height = 70;
this.onEnterFrame = function()
{
   _width = _height = _height - 10;
   _rotation = _rotation + 15;
   if(_alpha > 0)
   {
      _alpha = _alpha - 5;
   }
   else
   {
      this.removeMovieClip();
   }
};
