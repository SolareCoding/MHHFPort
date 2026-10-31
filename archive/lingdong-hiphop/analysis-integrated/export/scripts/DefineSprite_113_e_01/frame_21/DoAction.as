_root.enemy2_s1.start();
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
   }
}
