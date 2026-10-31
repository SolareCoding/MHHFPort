onClipEvent(load){
   this.onEnterFrame = function()
   {
      if(_root.bos > 0 && maxenemy > 0)
      {
         if(_root.diren < nowenemy)
         {
            aa = random(2);
            if(aa == 0)
            {
               _root.enemyLoad("e_05",random(_root.smx),random(_root.syy) + _root.sy);
            }
            else
            {
               _root.enemyLoad("e_05",random(_root.smx),random(_root.syy) + _root.sy);
            }
            maxenemy--;
         }
      }
      else if(_root.diren <= 0 && _root.bos <= 0)
      {
         _parent.nextFrame();
         delete this.onEnterFrame;
      }
   };
}
