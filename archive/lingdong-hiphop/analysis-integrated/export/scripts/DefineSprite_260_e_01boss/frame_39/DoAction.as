_parent.man.hitting = 1;
_root.e_bad.start();
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
