_root.hit_rock.start();
_root.kg01++;
if(_root.kg01 > 2)
{
   _root.kg01 = 0;
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
   }
}
