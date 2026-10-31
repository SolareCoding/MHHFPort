onClipEvent(enterFrame){
   if(_root.hp <= 0)
   {
      _parent.gotoAndPlay("倒");
   }
}
