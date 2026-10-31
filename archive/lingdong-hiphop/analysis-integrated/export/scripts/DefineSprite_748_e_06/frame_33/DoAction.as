if(g.hitTest(_parent.man.shiti) && !_parent.man.inair && _root.without == 0)
{
   stop();
   free.gotoAndPlay(2);
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
   _parent.man.long = 5;
   _root.hit_z3.start();
   _root.hp -= atk + 5;
   _parent.man.gotoAndPlay("倒");
}
