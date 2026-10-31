maxenemy = 150;
nowenemy = 10;
this.onEnterFrame = function()
{
   if(maxenemy > 0)
   {
      if(_root.silin < nowenemy)
      {
         _root.enemyLoad("e_09",random(_root.smx),random(_root.syy) + _root.sy);
         maxenemy--;
      }
   }
   else if(_root.silin <= 0)
   {
      _parent.zhuang.go.gotoAndPlay(2);
      delete this.onEnterFrame;
      this.removeMovieClip();
   }
};
