stop();
_width = 61.6;
_height = 67.7;
cc = _xscale;
speed = random(10) + 20;
this.onEnterFrame = function()
{
   if(_root.pause == 0)
   {
      this.swapDepths(100000 + _Y * 100 + id % 100);
      if(f == 1)
      {
         _X = _X - speed;
         _xscale = cc;
      }
      if(f == 0)
      {
         _X = _X + speed;
         _xscale = - cc;
      }
      if(_root.itemdel == 1 || _X < -20 || _X > 420)
      {
         this.removeMovieClip();
      }
      if(g.hitTest(_parent.man.shiti) && !_parent.man.inair && _root.without == 0)
      {
         if(hxyj == 0)
         {
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
            _root.hit_zs.start();
            _root.hp -= atk;
            _parent.man.gotoAndPlay("挨打");
         }
         if(hxyj == 1)
         {
            _parent.man.atkS = 1;
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
            _root.hit_z3.start();
            _root.hp -= atk;
            _parent.man.gotoAndPlay("倒");
         }
         gotoAndStop("爆炸");
         play();
      }
   }
};
