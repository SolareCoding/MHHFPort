onClipEvent(enterFrame){
   if(_parent.hp > 0)
   {
      i++;
      if(i > 25)
      {
         _parent.gotoAndPlay("站");
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
            _root.s += 200;
            _root.ex += 6;
         }
         else
         {
            _root.s += 100;
            _root.ex += 3;
         }
      }
      _root.diren--;
      _parent.removeMovieClip();
   }
}
