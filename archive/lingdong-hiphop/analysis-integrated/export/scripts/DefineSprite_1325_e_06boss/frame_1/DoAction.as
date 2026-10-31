function talk()
{
   bb = random(4);
   if(bb == 0)
   {
      _root.m_gj1.start();
   }
   if(bb == 1)
   {
      _root.m_gj2.start();
   }
   if(bb == 2)
   {
      _root.m_gj3.start();
   }
}
function adtalk()
{
   bb = random(2);
   if(bb == 0)
   {
      _root.m_ad2.start();
   }
}
stop();
_name = "boss";
myname = _name;
_root.game.zhuang.boss1.name = "邪恶假身";
_root.game.zhuang.boss1.gotoAndStop(2);
_root.silin++;
_root.bos++;
_alpha = 0;
_width = 87.2;
_height = 90.1;
cc = _xscale;
f = 1;
if(_root.hard == 0)
{
   hp = maxhp = _root.maxhp * 4;
   speed = _parent.man.speed;
   atk = _root.manAtk;
   Hit = 15;
   phit = 6;
   retort = 30;
}
else
{
   hp = maxhp = _root.maxhp * 4;
   speed = _parent.man.speed;
   atk = _root.manAtk;
   Hit = 10;
   phit = 5;
   retort = 20;
}
this.onEnterFrame = function()
{
   this.swapDepths(100000 + _Y * 100 + id % 100);
   if(hp >= maxhp)
   {
      hp = maxhp;
   }
   if(hp <= 0)
   {
      hp = 0;
   }
   if(_root.itemdel == 1)
   {
      this.removeMovieClip();
   }
   if(_root.rwalk == 1)
   {
      _X = _X - _parent.man.speed;
   }
   if(_root.rwalk == 2)
   {
      _X = _X - _parent.man.speed * 2;
   }
   if(_root.lwalk == 1)
   {
      _X = _X + _parent.man.speed;
   }
   if(_root.lwalk == 2)
   {
      _X = _X + _parent.man.speed * 2;
   }
};
