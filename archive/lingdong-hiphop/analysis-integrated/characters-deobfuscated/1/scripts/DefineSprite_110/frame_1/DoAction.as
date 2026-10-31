function getPosNow()
{
   var _loc2_ = {x:0,y:0};
   var _loc1_ = {x:0,y:0};
   localToGlobal(_loc2_);
   lineMC.localToGlobal(_loc1_);
   return {p1:_loc2_,p2:_loc1_};
}
if(rgb == null)
{
   rgb = _root.rgb;
}
if(alpha == null)
{
   alpha = _root.tm;
}
createEmptyMovieClip("shadowMC",0);
shadowMC.shaQueue = new Array();
shadowMC.queueLen = _root.long;
var p = getPosNow();
var i = 0;
while(i < shadowMC.queueLen)
{
   shadowMC.shaQueue.push(p);
   i++;
}
onEnterFrameFunc = function()
{
   shadowMC.pushPos();
   shadowMC.render();
};
shadowMC.pushPos = function()
{
   this.shaQueue.shift();
   this.shaQueue.push(getPosNow());
};
shadowMC.render = function()
{
   this.clear();
   var _loc10_ = alpha;
   var _loc13_ = _loc10_ / this.queueLen;
   var _loc3_ = [];
   var _loc5_;
   var _loc8_;
   var _loc6_;
   var _loc9_;
   for(var _loc2_ in this.shaQueue)
   {
      _loc5_ = this.shaQueue[_loc2_].p1;
      _loc8_ = this.shaQueue[_loc2_].p2;
      _loc6_ = {x:_loc5_.x,y:_loc5_.y};
      _loc9_ = {x:_loc8_.x,y:_loc8_.y};
      this.globalToLocal(_loc6_);
      this.globalToLocal(_loc9_);
      _loc3_[_loc2_] = {p1:_loc6_,p2:_loc9_};
   }
   var _loc2_ = _loc3_.length - 1;
   var _loc4_;
   var _loc7_;
   while(_loc2_ > 0)
   {
      _loc5_ = _loc3_[_loc2_].p1;
      _loc8_ = _loc3_[_loc2_].p2;
      _loc4_ = _loc3_[_loc2_ - 1].p2;
      _loc7_ = _loc3_[_loc2_ - 1].p1;
      this.beginFill(rgb,_loc10_);
      this.moveTo(_loc5_.x,_loc5_.y);
      this.lineTo(_loc8_.x,_loc8_.y);
      this.lineTo(_loc4_.x,_loc4_.y);
      this.endFill();
      this.beginFill(rgb,_loc10_);
      this.moveTo(_loc4_.x,_loc4_.y);
      this.lineTo(_loc7_.x,_loc7_.y);
      this.lineTo(_loc5_.x,_loc5_.y);
      this.endFill();
      _loc10_ -= _loc13_;
      _loc2_ = _loc2_ - 1;
   }
};
