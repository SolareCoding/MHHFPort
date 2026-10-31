_root.hit_rock.start();
if(_root.kg03 == 0)
{
   _root.kg03 = 1;
}
if(_root.kg03 == 1)
{
   _root.kg03 = 0;
}
_parent.man.hitting = 1;
if(_root.superB == false)
{
   if(!_parent.man.inair)
   {
      _parent.man.stop();
   }
   else
   {
      _root.jumpStay = true;
      _root.lwalk = 0;
      _root.rwalk = 0;
   }
}
