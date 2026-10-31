_parent.Throw.diePower = 1;
_root.hit_q3.start();
this.attachMovie("atk_cbs","atk_rock",1);
_parent.Throw.hp -= _root.m_3;
_parent.Throw.gotoAndPlay("倒");
_root.s += 15;
talk();
_root.w_wdd.start();
