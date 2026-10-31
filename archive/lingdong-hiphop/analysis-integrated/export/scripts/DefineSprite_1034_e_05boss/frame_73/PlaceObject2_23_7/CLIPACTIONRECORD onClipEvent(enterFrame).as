onClipEvent(enterFrame){
   if(_parent.hp > 0)
   {
      i++;
      if(i > 25)
      {
         aa = random(2);
         if(aa == 0)
         {
            _parent.gotoAndStop("防1");
         }
         if(aa == 1)
         {
            _parent.gotoAndStop("防御");
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
         _root.s += 20000;
         _root.ex += 500;
      }
      else
      {
         _root.s += 10000;
         _root.ex += 250;
      }
      _root.diren--;
      _root.bos--;
      _parent.removeMovieClip();
   }
}
