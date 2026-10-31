if(g.hitTest(_parent.man.shiti) && !_parent.man.inair && _root.without == 0)
{
   stop();
   free.gotoAndPlay(2);
   _parent.man.atkS = 2;
   _parent.man.fly = true;
   _parent.man.freeze = false;
   if(_X < _parent.man._x)
   {
      _parent.man.ff = 1;
   }
   else
   {
      _parent.man.ff = 0;
   }
   _root.hit_q3.start();
   hx = random(phit);
   if(hx == 1)
   {
      _parent.man.long = 10;
      _root.hp -= atk + 10;
      _parent.man.gotoAndPlay("倒");
   }
   else
   {
      _parent.man.long = 5;
      _root.hp -= atk;
      _parent.man.gotoAndPlay("挨打");
   }
}
