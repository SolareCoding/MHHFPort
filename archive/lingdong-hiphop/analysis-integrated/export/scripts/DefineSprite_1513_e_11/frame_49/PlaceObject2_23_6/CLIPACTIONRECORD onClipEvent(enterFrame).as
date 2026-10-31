onClipEvent(enterFrame){
   if(_parent.hp > 0)
   {
      i++;
      if(i > 25)
      {
         _parent.gotoAndPlay("起");
      }
   }
   else if(_parent._alpha > 0)
   {
      _parent._alpha -= 2;
   }
   else
   {
      if(_root.bos <= 0)
      {
         if(_root.hp >= _root.maxhp)
         {
            _root.s += 800;
            _root.ex += 15;
         }
         else
         {
            _root.s += 400;
            _root.ex += 12;
         }
      }
      _root.diren--;
      _parent.removeMovieClip();
   }
}
