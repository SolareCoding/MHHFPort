_width = 41.5;
_height = 37;
itemout = _parent.zhuang.itemout;
s = random(500) + 1000;
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
      _root.s += s;
      itemout.out = "得到" + s + "分";
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
