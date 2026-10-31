onClipEvent(enterFrame){
   _root.rwalk = 0;
   _root.lwalk = 0;
   if(_root.hp <= 0)
   {
      _parent.gotoAndPlay("倒");
   }
}
