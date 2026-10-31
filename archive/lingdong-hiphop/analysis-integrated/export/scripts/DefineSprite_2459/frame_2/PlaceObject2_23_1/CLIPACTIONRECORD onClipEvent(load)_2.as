onClipEvent(load){
   this.onEnterFrame = function()
   {
      if(maxenemy > 0)
      {
         if(_root.diren < nowenemy)
         {
            _root.enemyLoad("e_01",random(_root.smx),random(_root.syy) + _root.sy);
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
