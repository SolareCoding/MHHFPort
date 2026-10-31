onClipEvent(enterFrame){
   if(_parent.hp > 0)
   {
      i++;
      if(i > 25)
      {
         _parent.gotoAndPlay("攻击无敌");
      }
   }
   else if(_parent._alpha > 0)
   {
      _parent._alpha -= 2;
   }
   else
   {
      if(_root.hp >= _root.maxhp)
      {
         _root.s += 2000;
         _root.ex += 75;
      }
      else
      {
         _root.s += 1000;
         _root.ex += 50;
      }
      _root.diren--;
      _root.bos--;
      _parent.removeMovieClip();
   }
}
