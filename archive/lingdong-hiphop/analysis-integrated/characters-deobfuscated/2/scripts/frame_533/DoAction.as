stop();
if(_root.life > 0)
{
   _root.life--;
   _parent.ming1 = true;
   _root.hp = _root.maxhp;
   _root.mp = _root.maxmp;
   _root.Time = 99;
   play();
}
else
{
   _root.over = 1;
   _parent.zhuang.gover.gotoAndPlay(2);
   this.removeMovieClip();
}
