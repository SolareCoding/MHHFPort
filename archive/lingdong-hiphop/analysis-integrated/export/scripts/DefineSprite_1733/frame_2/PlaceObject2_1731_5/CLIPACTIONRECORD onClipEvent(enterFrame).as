onClipEvent(enterFrame){
   if(_root.up == "设置中...")
   {
      _parent.out = "上行键设置...";
   }
   if(_root.down == "设置中...")
   {
      _parent.out = "下蹲键设置...";
   }
   if(_root.left == "设置中...")
   {
      _parent.out = "左行键设置...";
   }
   if(_root.right == "设置中...")
   {
      _parent.out = "右行键设置...";
   }
   if(_root.atk == "设置中...")
   {
      _parent.out = "攻击键设置...";
   }
   if(_root.jump == "设置中...")
   {
      _parent.out = "跳跃键设置...";
   }
   if(_root.zt == "设置中...")
   {
      _parent.out = "暂停键设置...";
   }
   if(Key.isDown(Key.getCode()))
   {
      if(_root.up == "设置中...")
      {
         _root.up = Key.getCode();
         _root.w_wd2.start();
         _parent.gotoAndStop(1);
      }
      if(_root.down == "设置中...")
      {
         _root.down = Key.getCode();
         _root.w_wd2.start();
         _parent.gotoAndStop(1);
      }
      if(_root.left == "设置中...")
      {
         _root.left = Key.getCode();
         _root.w_wd2.start();
         _parent.gotoAndStop(1);
      }
      if(_root.right == "设置中...")
      {
         _root.right = Key.getCode();
         _root.w_wd2.start();
         _parent.gotoAndStop(1);
      }
      if(_root.jump == "设置中...")
      {
         _root.jump = Key.getCode();
         _root.w_wd2.start();
         _parent.gotoAndStop(1);
      }
      if(_root.atk == "设置中...")
      {
         _root.atk = Key.getCode();
         _root.w_wd2.start();
         _parent.gotoAndStop(1);
      }
      if(_root.zt == "设置中...")
      {
         _root.zt = Key.getCode();
         _root.w_wd2.start();
         _parent.gotoAndStop(1);
      }
   }
}
