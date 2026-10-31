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
            _root.s += 200;
            _root.ex += 5;
         }
         else
         {
            _root.s += 100;
            _root.ex += 2;
         }
      }
      _root.silin--;
      _root.bairen++;
      _parent.removeMovieClip();
   }
}
