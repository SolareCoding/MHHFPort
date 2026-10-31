if(g.hitTest(_parent.man.shiti) && !_parent.man.inair && _root.without == 0)
{
   hx = random(phit);
   if(hx == 0)
   {
      _parent.man.atkS = 2;
      _parent.man.gotoAndPlay("倒");
      _root.hit_q3.start();
      _root.hp -= atk + 5;
   }
   else
   {
      _parent.man.atkS = 1;
      _parent.man.gotoAndPlay("挨打");
      _root.hit_q3.start();
      _root.hp -= atk;
   }
   if(_X > _parent.man._x && _parent.man._x > _root.sx)
   {
      _parent.man._x -= 5;
   }
   if(_X <= _parent.man._x && _parent.man._x < _root.smx)
   {
      _parent.man._x += 5;
   }
}
