if(g.hitTest(_parent.man.shiti) && !_parent.man.inair && _root.without == 0)
{
   a = random(Hit);
   if(a < 5)
   {
      gotoAndPlay(28);
   }
   if(a == 5)
   {
      gotoAndStop("防2");
      play();
   }
}
