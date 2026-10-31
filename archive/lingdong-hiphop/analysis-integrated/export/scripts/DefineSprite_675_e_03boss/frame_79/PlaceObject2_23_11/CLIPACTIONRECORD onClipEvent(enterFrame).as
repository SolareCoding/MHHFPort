onClipEvent(enterFrame){
   if(hitTest(man.h1))
   {
      man.hitLeave = 1;
      man.t = 0;
      _parent.attachMovie("atk_rock","atk_rock",1);
      _root.x_wqzj.start();
      if(_parent.f == 1 && _parent._x < _root.smx)
      {
         _parent._x += 5;
      }
      else if(_parent.f == 0 && _parent._x > _root.sx)
      {
         _parent._x -= 5;
      }
   }
   if(hitTest(man.h2))
   {
      man.hitLeave = 2;
      man.t = 0;
      _parent.attachMovie("atk_rock","atk_rock",1);
      _root.x_wqzj.start();
      if(_parent.f == 1 && _parent._x < _root.smx)
      {
         _parent._x += 5;
      }
      else if(_parent.f == 0 && _parent._x > _root.sx)
      {
         _parent._x -= 5;
      }
   }
   if(hitTest(man.h3))
   {
      man.hitLeave = 0;
      man.t = 0;
      _parent.attachMovie("atk_rock","atk_rock",1);
      _root.x_wqzj.start();
      if(_parent.f == 1 && _parent._x < _root.smx)
      {
         _parent._x += 5;
      }
      else if(_parent.f == 0 && _parent._x > _root.sx)
      {
         _parent._x -= 5;
      }
   }
   if(hitTest(_parent._parent.yinyin.h1) && _parent.hitTest(_parent._parent.man.shiti))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _root.x_wqzj.start();
      _parent._parent.yinyin.h1._name = "hh";
      if(_parent.f == 1 && _parent._x < _root.smx)
      {
         _parent._x += 5;
      }
      else if(_parent.f == 0 && _parent._x > _root.sx)
      {
         _parent._x -= 5;
      }
   }
   if(hitTest(man.ts))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _root.x_wqzj.start();
      if(_parent.f == 1 && _parent._x < _root.smx)
      {
         _parent._x += 5;
      }
      else if(_parent.f == 0 && _parent._x > _root.sx)
      {
         _parent._x -= 5;
      }
   }
   if(hitTest(man.ts1))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _root.x_wqzj.start();
      if(_parent.f == 1 && _parent._x < _root.smx)
      {
         _parent._x += 5;
      }
      else if(_parent.f == 0 && _parent._x > _root.sx)
      {
         _parent._x -= 5;
      }
   }
   if(hitTest(man.b_cj))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _root.x_wqzj.start();
      if(_parent.f == 1 && _parent._x < _root.smx)
      {
         _parent._x += 10;
      }
      else if(_parent.f == 0 && _parent._x > _root.sx)
      {
         _parent._x -= 10;
      }
   }
   if(hitTest(man.b_fk))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _root.x_wqzj.start();
      if(_parent.f == 1 && _parent._x < _root.smx)
      {
         _parent._x += 5;
      }
      else if(_parent.f == 0 && _parent._x > _root.sx)
      {
         _parent._x -= 5;
      }
   }
   if(hitTest(man.b_fk3))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _root.x_wqzj.start();
      if(_parent.f == 1 && _parent._x < _root.smx)
      {
         _parent._x += 5;
      }
      else if(_parent.f == 0 && _parent._x > _root.sx)
      {
         _parent._x -= 5;
      }
   }
   if(hitTest(man.b_fire))
   {
      _parent.attachMovie("atk_rock2","atk_rock",1);
      _root.hit_q3.start();
      _parent.hp -= _root.m_hl;
      _parent.diePower = 1;
      _parent.gotoAndPlay("倒");
   }
   if(hitTest(man.b_gb1))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _root.x_wqzj.start();
      if(_parent.f == 1 && _parent._x < _root.smx)
      {
         _parent._x += 5;
      }
      else if(_parent.f == 0 && _parent._x > _root.sx)
      {
         _parent._x -= 5;
      }
   }
   if(hitTest(man.b_gb2))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _root.x_wqzj.start();
      if(_parent.f == 1 && _parent._x < _root.smx)
      {
         _parent._x += 10;
      }
      else if(_parent.f == 0 && _parent._x > _root.sx)
      {
         _parent._x -= 10;
      }
   }
   if(hitTest(man.b_gb3))
   {
      _parent.attachMovie("atk_rock2","atk_rock",1);
      _root.x_wqzj.start();
      if(_parent.f == 1 && _parent._x < _root.smx)
      {
         _parent._x += 15;
      }
      else if(_parent.f == 0 && _parent._x > _root.sx)
      {
         _parent._x -= 15;
      }
   }
   if(hitTest(man.bsq.b_cbs))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _parent._parent.man.gotoAndPlay("乱舞");
   }
   if(hitTest(man.b_cbs2))
   {
      _parent.attachMovie("atk_cbs","atk_rock",1);
      combo();
      _root.hit_q3.start();
      _parent.hp -= _root.m_lw;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(long.b_lc))
   {
      _parent.attachMovie("atk_cbs","atk_rock",1);
      combo();
      _root.hit_q3.start();
      _parent.hp -= _root.m_lc;
      _root.superB = false;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(_parent._parent.Throw.thro))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _root.hit_q1.start();
      _parent.gotoAndPlay("倒");
   }
}
