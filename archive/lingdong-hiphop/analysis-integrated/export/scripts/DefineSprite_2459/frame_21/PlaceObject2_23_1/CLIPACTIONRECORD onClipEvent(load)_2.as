onClipEvent(load){
   this.onEnterFrame = function()
   {
      if(maxenemy > 0)
      {
         if(_root.diren < nowenemy)
         {
            aaa = random(2);
            if(aaa == 0)
            {
               _root.enemyLoad("e_01",random(_root.smx),random(_root.syy) + _root.sy);
            }
            if(aaa == 1)
            {
               _root.enemyLoad("e_03",random(_root.smx),random(_root.syy) + _root.sy);
            }
            maxenemy--;
         }
      }
      else if(_root.diren <= 0)
      {
         _parent.zhuang.go.gotoAndPlay(2);
         _parent.nextFrame();
         delete this.onEnterFrame;
      }
   };
}
