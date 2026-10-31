maxenemy = 100;
nowenemy = 10;
this.onEnterFrame = function()
{
   if(maxenemy > 0)
   {
      if(_root.silin < nowenemy)
      {
         _root.enemyLoad("e_08",random(_root.smx),random(_root.syy) + _root.sy);
         maxenemy--;
      }
   }
   else if(_root.silin <= 0)
   {
      delete this.onEnterFrame;
      gotoAndPlay(3);
   }
};
