onClipEvent(enterFrame){
   if(_parent.hp > 0)
   {
      i++;
      if(i > 25)
      {
         _parent.gotoAndStop("防1");
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
         _root.s += 6000;
         _root.ex += 400;
      }
      else
      {
         _root.s += 3500;
         _root.ex += 200;
      }
      _root.silin--;
      _root.bos--;
      _parent.removeMovieClip();
   }
}
