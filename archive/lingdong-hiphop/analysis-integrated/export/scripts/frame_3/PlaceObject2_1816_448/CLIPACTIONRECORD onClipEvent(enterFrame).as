onClipEvent(enterFrame){
   if(_root.sowrd == 0)
   {
      _root.s_name = "十字剑";
      _root.sAtk = 5;
      _root.mpSpeed = 30;
      _root.game.man.speed = 5;
      _root.m_rgb = _root.rgb = 16777215;
   }
   if(_root.sowrd == 1)
   {
      _root.s_name = "十字阔剑";
      _root.sAtk = 15;
      _root.mpSpeed = 40;
      _root.game.man.speed = 3;
      _root.m_rgb = _root.rgb = 13382400;
   }
   if(_root.sowrd == 2)
   {
      _root.s_name = "碧血剑";
      _root.sAtk = 10;
      _root.mpSpeed = 15;
      _root.game.man.speed = 5;
      _root.m_rgb = _root.rgb = 3381759;
   }
   if(_root.sowrd == 3)
   {
      _root.s_name = "幽魂剑";
      _root.sAtk = 16;
      _root.mpSpeed = 25;
      _root.game.man.speed = 5;
      _root.m_rgb = _root.rgb = 13369599;
   }
   if(_root.sowrd == 4)
   {
      _root.s_name = "嗜血魔剑";
      _root.sAtk = 35;
      _root.mpSpeed = 20;
      _root.game.man.speed = 5;
      _root.m_rgb = _root.rgb = 0;
      if(i > _root.ii && _root.pause == 0)
      {
         if(_root.hp > 1)
         {
            _root.hp--;
            i = 0;
         }
      }
      else
      {
         i++;
      }
   }
   if(_root.sowrd == 5)
   {
      _root.s_name = "烈焰阔剑";
      _root.sAtk = 25;
      _root.mpSpeed = 20;
      _root.game.man.speed = 5;
      _root.m_rgb = _root.rgb = 16711680;
   }
   _root.manAtk = _root.MAtk + _root.sAtk;
   _root.m_1 = _root.manAtk + 5;
   _root.m_2 = _root.manAtk + 10;
   _root.m_3 = _root.manAtk + 20;
   _root.m_j1 = 5;
   _root.m_ts1 = _root.manAtk + 10;
   _root.m_ts2 = _root.manAtk + 15;
   _root.m_cj1 = _root.manAtk + 15;
   _root.m_fk1 = _root.manAtk + 15;
   _root.m_fk2 = _root.manAtk + 20;
   _root.m_hl = 15;
   _root.m_gt1 = _root.manAtk + 10;
   _root.m_gt2 = _root.manAtk + 20;
   _root.m_gt3 = _root.manAtk + 35;
   _root.m_lw = _root.manAtk + 20;
   _root.m_lc = _root.manAtk + 30;
   if(Key.isDown(_root.atk))
   {
      _root.atkpress = 1;
   }
   else
   {
      _root.atkpress = 0;
   }
   if(Key.isDown(_root.jump))
   {
      _root.jumppress = 1;
   }
   else
   {
      _root.jumppress = 0;
   }
   if(Key.isDown(_root.left))
   {
      _root.lpress = 1;
   }
   else
   {
      _root.lpress = 0;
   }
   if(Key.isDown(_root.right))
   {
      _root.rpress = 1;
   }
   else
   {
      _root.rpress = 0;
   }
   if(Key.isDown(_root.up))
   {
      _root.upress = 1;
   }
   else
   {
      _root.upress = 0;
   }
   if(Key.isDown(_root.down))
   {
      _root.dpress = 1;
   }
   else
   {
      _root.dpress = 0;
   }
   if(_root.pause == 1)
   {
      _root.rwalk = 0;
      _root.lwalk = 0;
   }
}
