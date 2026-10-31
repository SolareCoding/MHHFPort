onClipEvent(enterFrame){
   if(_root.pause == 0)
   {
      if(hitTest(_parent._parent.man.shiti))
      {
         a = random(_parent.Hit);
         if(a == 1)
         {
            _parent.gotoAndPlay("攻击");
         }
      }
   }
}
