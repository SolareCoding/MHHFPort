if(g.hitTest(_parent.man.shiti) && !_parent.man.inair && _root.without == 0)
{
   stop();
   free.gotoAndPlay(2);
   _parent.man.atkS = 0;
   _parent.man.fly = true;
   if(_X < _parent.man._x)
   {
      _parent.man.ff = 1;
   }
   else
   {
      _parent.man.ff = 0;
   }
   _parent.man.long = 3;
   _root.x_down.start();
   _root.hit_q1.start();
   _root.hp -= atk;
   _parent.man.gotoAndPlay("挨打");
}
if(g.hitTest(_parent.yinyin) && _root.without == 0)
{
   stop();
   free.gotoAndPlay(2);
   _parent.man.atkS = 0;
   _parent.man.inair = false;
   _parent.man._y = _parent.yinyin._y;
   _parent.yinyin.removeMovieClip();
   _parent.man.fly = true;
   if(_X < _parent.man._x)
   {
      _parent.man.ff = 1;
   }
   else
   {
      _parent.man.ff = 0;
   }
   _parent.man.long = 10;
   _root.x_down.start();
   _root.hit_q1.start();
   _root.hp -= atk;
   _parent.man.gotoAndPlay("倒");
}
