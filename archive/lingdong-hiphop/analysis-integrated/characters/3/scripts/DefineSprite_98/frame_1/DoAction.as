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
function getPosNow()
{
   var _loc2_ = {e:0,f:0};
   var _loc1_ = {e:0,f:0};
   g(_loc2_);
   h.g(_loc1_);
   return {(§§constant(4)):_loc2_,(§§constant(5)):_loc1_};
}
if(eval(§§constant(6)) == null)
{
   set(§§constant(6),eval(§§constant(7))[§§constant(6)]);
}
if(eval(§§constant(8)) == null)
{
   set(§§constant(8),eval(§§constant(7))[§§constant(9)]);
}
§§constant(11)(§§constant(10),0);
eval(§§constant(10))[§§constant(12)] = new §\§\§constant(13)§();
eval(§§constant(10))[§§constant(14)] = eval(§§constant(7))[§§constant(15)];
var §§constant(16) = §§constant(17)();
var §§constant(18) = 0;
while(eval(§§constant(18)) < eval(§§constant(10))[§§constant(14)])
{
   eval(§§constant(10))[§§constant(12)][§§constant(19)](eval(§§constant(16)));
   set(§§constant(18),eval(§§constant(18)) + 1);
}
set(§§constant(20),function()
{
   eval(§§constant(10))[§§constant(21)]();
   eval(§§constant(10))[§§constant(22)]();
});
eval(§§constant(10))[§§constant(21)] = function()
{
   this[§§constant(12)][§§constant(23)]();
   this[§§constant(12)][§§constant(19)](§§constant(17)());
};
eval(§§constant(10))[§§constant(22)] = function()
{
   this[§§constant(24)]();
   var _loc10_ = eval(§§constant(8));
   var _loc13_ = _loc10_ / this[§§constant(14)];
   var _loc3_ = [];
   var _loc5_;
   var _loc8_;
   var _loc6_;
   var _loc9_;
   for(var _loc2_ in this[§§constant(12)])
   {
      _loc5_ = this[§§constant(12)][_loc2_][§§constant(4)];
      _loc8_ = this[§§constant(12)][_loc2_][§§constant(5)];
      _loc6_ = {e:_loc5_.e,f:_loc5_.f};
      _loc9_ = {e:_loc8_.e,f:_loc8_.f};
      this[§§constant(25)](_loc6_);
      this[§§constant(25)](_loc9_);
      _loc3_[_loc2_] = {(§§constant(4)):_loc6_,(§§constant(5)):_loc9_};
   }
   var _loc2_ = _loc3_[§§constant(26)] - 1;
   var _loc4_;
   var _loc7_;
   while(_loc2_ > 0)
   {
      _loc5_ = _loc3_[_loc2_][§§constant(4)];
      _loc8_ = _loc3_[_loc2_][§§constant(5)];
      _loc4_ = _loc3_[_loc2_ - 1][§§constant(5)];
      _loc7_ = _loc3_[_loc2_ - 1][§§constant(4)];
      this[§§constant(27)](eval(§§constant(6)),_loc10_);
      this[§§constant(28)](_loc5_.e,_loc5_.f);
      this[§§constant(29)](_loc8_.e,_loc8_.f);
      this[§§constant(29)](_loc4_.e,_loc4_.f);
      this[§§constant(30)]();
      this[§§constant(27)](eval(§§constant(6)),_loc10_);
      this[§§constant(28)](_loc4_.e,_loc4_.f);
      this[§§constant(29)](_loc7_.e,_loc7_.f);
      this[§§constant(29)](_loc5_.e,_loc5_.f);
      this[§§constant(30)]();
      _loc10_ -= _loc13_;
      _loc2_ = _loc2_ - 1;
   }
};
