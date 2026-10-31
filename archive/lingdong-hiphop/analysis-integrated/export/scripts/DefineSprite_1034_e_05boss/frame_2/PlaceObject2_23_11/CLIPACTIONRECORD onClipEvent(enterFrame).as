onClipEvent(enterFrame){
   if(_root.pause == 0)
   {
      if(hitTest(_parent._parent.man.shiti))
      {
         a = random(_parent.Hit);
         if(a < 2)
         {
            _parent.gotoAndPlay("攻击");
         }
         if(a == 3)
         {
            _parent.gotoAndPlay("攻击2");
         }
         if(a == 4 && _parent.hp < _parent.maxhp * 0.5)
         {
            _parent.gotoAndPlay("防御");
         }
         if(a == 5 && _parent.hp < _parent.maxhp * 0.6)
         {
            _parent.gotoAndPlay("必杀");
         }
      }
      else
      {
         aaa = random(100);
         if(aaa == 1)
         {
            _parent.gotoAndPlay("防1");
         }
      }
   }
}
