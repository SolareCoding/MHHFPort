onClipEvent(enterFrame){
   if(_root.pause == 0)
   {
      if(hitTest(_parent._parent.man.shiti))
      {
         a = random(_parent.Hit);
         if(a == 1)
         {
            _parent.gotoAndPlay("攻击小");
         }
         if(a == 2)
         {
            _parent.gotoAndPlay("攻击");
         }
         if(a == 3)
         {
            _parent.gotoAndPlay("攻击3");
         }
      }
   }
}
