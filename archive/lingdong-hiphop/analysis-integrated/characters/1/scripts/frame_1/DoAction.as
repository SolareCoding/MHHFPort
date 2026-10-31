§§push(true);
§§push(false);
§§push(false);
§§push(true);
while(true)
{
   if(§§pop())
   {
   }
   if(§§pop())
   {
   }
   if(§§pop())
   {
      break;
   }
   §§push(true);
   §§push(false);
}
function huifu()
{
   _root.e = _root.f;
   _root.g = _root.h;
   _root[§§constant(4)] = _root[§§constant(5)];
}
function talk()
{
   set(§§constant(6),random(4));
   if(eval(§§constant(6)) == 0)
   {
      _root[§§constant(7)][§§constant(8)]();
   }
   if(eval(§§constant(6)) == 1)
   {
      _root[§§constant(9)][§§constant(8)]();
   }
   if(eval(§§constant(6)) == 2)
   {
      _root[§§constant(10)][§§constant(8)]();
   }
}
function talk2()
{
   set(§§constant(6),random(2));
   if(eval(§§constant(6)) == 0)
   {
      _root[§§constant(11)][§§constant(8)]();
   }
   if(eval(§§constant(6)) == 1)
   {
      _root[§§constant(12)][§§constant(8)]();
   }
}
function atkSS()
{
   if(eval(§§constant(13)) == 0)
   {
      this[§§constant(16)](§§constant(15),§§constant(14),1);
   }
   if(eval(§§constant(13)) == 1)
   {
      this[§§constant(16)](§§constant(17),§§constant(14),1);
   }
   if(eval(§§constant(13)) == 2)
   {
      this[§§constant(16)](§§constant(18),§§constant(14),1);
   }
}
eval(§§constant(19))[§§constant(20)] = false;
eval(§§constant(19))[§§constant(21)] = §§constant(22);
eval(§§constant(24))[§§constant(25)][§§constant(26)](§§constant(23));
stop();
set(§§constant(27),5);
set(§§constant(28),0);
setProperty(§§constant(29), _width, 87.2);
setProperty(§§constant(29), _height, 90.1);
set(§§constant(30),getProperty(§§constant(29), _xscale));
set(§§constant(31),0);
set(§§constant(32),false);
set(§§constant(33),false);
var §§constant(34) = true;
var §§constant(35) = 0;
var §§constant(36) = -15;
var §§constant(37) = 2;
set(§§constant(38),eval(§§constant(39))[§§constant(40)] / 2 + eval(§§constant(39))[§§constant(41)]);
eval(§§constant(42))[§§constant(43)] = function()
{
   eval(§§constant(44))[§§constant(45)]();
   if(_root[§§constant(46)] == 0)
   {
      if(eval(§§constant(34)))
      {
         this[§§constant(50)](100000 + _parent[§§constant(47)][§§constant(48)] * 100 + eval(§§constant(49)) % 100);
         gotoAndStop("跳");
      }
      else
      {
         this[§§constant(50)](100000 + getProperty(§§constant(29), _Y) * 100 + eval(§§constant(49)) % 100);
      }
      if(eval(§§constant(51)) < 15)
      {
         set(§§constant(51),eval(§§constant(51)) + 1);
      }
      else
      {
         set(§§constant(31),0);
         set(§§constant(51),0);
      }
   }
};
