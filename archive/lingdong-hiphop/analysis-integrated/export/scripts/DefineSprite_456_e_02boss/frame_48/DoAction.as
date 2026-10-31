if(g.hitTest(_parent.man.shiti) && !_parent.man.inair && _root.without == 0)
{
   stop();
   free.gotoAndPlay(2);
   _parent.man.atkS = 2;
   _parent.man.fly = true;
   if(_X < _parent.man._x)
   {
      _parent.man.ff = 1;
   }
   else
   {
      _parent.man.ff = 0;
   }
   _parent.man.long = 15;
   _root.hit_q3.start();
   _root.hp -= atk;
   _parent.man.gotoAndPlay("倒");
}
if(g.hitTest(_parent.yinyin) && _root.without == 0)
{
   stop();
   free.gotoAndPlay(2);
   _parent.man.atkS = 2;
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
   _parent.man.long = 15;
   _root.hit_q3.start();
   _root.hp -= atk;
   _parent.man.gotoAndPlay("倒");
}
