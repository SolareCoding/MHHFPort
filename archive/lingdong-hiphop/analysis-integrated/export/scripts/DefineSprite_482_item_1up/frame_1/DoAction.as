_width = _height = 36;
itemout = _parent.zhuang.itemout;
this.onEnterFrame = function()
{
   this.swapDepths(100000 + _Y * 100 + id % 100);
   if(_root.itemdel == 1)
   {
      this.removeMovieClip();
   }
   if(g.hitTest(_parent.man.chi))
   {
      _root.x_eat.start();
      _parent.man.gotoAndPlay("吃");
      itemout.gotoAndPlay(2);
      _root.life = _root.life + 1;
      itemout.out = "生命1UP";
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
