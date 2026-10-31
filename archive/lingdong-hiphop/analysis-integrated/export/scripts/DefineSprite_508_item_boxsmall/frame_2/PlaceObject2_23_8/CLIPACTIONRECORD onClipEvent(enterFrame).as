onClipEvent(enterFrame){
   if(hitTest(man.h1))
   {
      man.hitLeave = 1;
      man.t = 0;
      _parent.attachMovie("atk_rock","atk_rock",1);
      _parent.hp -= 10;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(man.h2))
   {
      man.hitLeave = 2;
      man.t = 0;
      _parent.attachMovie("atk_rock","atk_rock",1);
      _parent.hp -= 10;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(man.h3))
   {
      man.hitLeave = 0;
      man.t = 0;
      _parent.attachMovie("atk_rock","atk_rock",1);
      _parent.hp -= 10;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(_parent._parent.yinyin.h1) && _parent.hitTest(_parent._parent.man.shiti))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _parent.hp -= 10;
      _parent.gotoAndPlay("挨打");
      _parent._parent.yinyin.h1._name = "hh";
   }
   if(hitTest(man.ts))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _parent.hp -= 10;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(man.ts1))
   {
      _parent.attachMovie("atk_rock2","atk_rock",1);
      _parent.hp -= 10;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(man.b_cj))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _parent.hp -= 10;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(man.b_fk))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _parent.hp -= 10;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(man.b_fk3))
   {
      _parent.attachMovie("atk_rock2","atk_rock",1);
      _parent.hp -= 10;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(man.b_fire))
   {
      _parent.attachMovie("atk_rock2","atk_rock",1);
      _parent.hp -= 10;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(man.b_gb1))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _parent.hp -= 10;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(man.b_gb2))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _parent.hp -= 10;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(man.b_gb3))
   {
      _parent.attachMovie("atk_rock2","atk_rock",1);
      _parent.hp -= 30;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(man.bsq.b_cbs))
   {
      _parent.attachMovie("atk_rock","atk_rock",1);
      _parent._parent.man.gotoAndPlay("乱舞");
   }
   if(hitTest(man.b_cbs2))
   {
      _parent.attachMovie("atk_cbs","atk_rock",1);
      _parent.hp -= 30;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(long.b_lc))
   {
      _parent.attachMovie("atk_cbs","atk_rock",1);
      _parent.hp -= 10;
      _parent.gotoAndPlay("挨打");
   }
   if(hitTest(_parent._parent.Throw.thro))
   {
      _parent.attachMovie("atk_rock2","atk_rock",1);
      _parent.hp -= 50;
      _parent.gotoAndPlay("挨打");
   }
}
