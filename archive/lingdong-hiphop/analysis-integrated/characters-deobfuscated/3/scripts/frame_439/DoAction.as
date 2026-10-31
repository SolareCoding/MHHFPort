_root.hit_q3.start();
iiii--;
if(_parent.Throw.f == 0)
{
   _parent.Throw._x -= 10;
}
else
{
   _parent.Throw._x += 10;
}
this.attachMovie("atk_rock2","atk_rock",1);
_parent.Throw.hp -= _root.MAtk;
_root.s += 5;
_root.mp += 1;
if(_parent.Throw.hp <= 0)
{
   _parent.Throw.gotoAndPlay("倒");
   take = false;
}
if(iiii <= 0)
{
   _parent.Throw.gotoAndPlay("倒");
   _parent.Throw._name = _parent.Throw.myname;
   take = false;
}
