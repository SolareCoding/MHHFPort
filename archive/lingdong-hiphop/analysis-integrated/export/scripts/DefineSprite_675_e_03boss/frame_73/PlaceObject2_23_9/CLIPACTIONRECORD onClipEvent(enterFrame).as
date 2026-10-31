onClipEvent(enterFrame){
   if(_parent.hp > 0)
   {
      i++;
      if(i > 25)
      {
         aa = random(1);
         if(aa == 0)
         {
            _parent.gotoAndStop("防1");
         }
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
         _root.s += 3500;
         _root.ex += 120;
      }
      else
      {
         _root.s += 2000;
         _root.ex += 70;
      }
      _root.diren--;
      _root.bos--;
      _parent.removeMovieClip();
   }
}
