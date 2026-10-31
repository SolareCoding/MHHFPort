function huifu()
{
   _root.long = _root.m_long;
   _root.rgb = _root.m_rgb;
   _root.tm = _root.m_tm;
}
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
function talk2()
{
   bb = random(2);
   if(bb == 0)
   {
      _root.m_dgj.start();
   }
   if(bb == 1)
   {
      _root.m_dgj2.start();
   }
}
function atkSS()
{
   if(atkS == 0)
   {
      this.attachMovie("atk_nos","atk_rock",1);
   }
   if(atkS == 1)
   {
      this.attachMovie("atk_rock2","atk_rock",1);
   }
   if(atkS == 2)
   {
      this.attachMovie("atk_cbs","atk_rock",1);
   }
}
Stage.scaleMode = "noScale";
Stage.showMenu = false;
System.security.allowDomain("*");
stop();
speed = 5;
f = 0;
_width = 120;
_height = 115.1;
cc = _xscale;
hitLeave = 0;
freeze = false;
fly = false;
var inair = true;
var yinc = 0;
var jumpspeed = -15;
var g = 2;
ldd = _root.syy / 2 + _root.sy;
this.onEnterFrame = function()
{
   mc.onEnterFrameFunc();
   if(_root.pause == 0)
   {
      if(inair)
      {
         this.swapDepths(100000 + _parent.yinyin._y * 100 + id % 100);
         gotoAndStop("跳");
      }
      else
      {
         this.swapDepths(100000 + _Y * 100 + id % 100);
      }
      if(t < 15)
      {
         t++;
      }
      else
      {
         hitLeave = 0;
         t = 0;
      }
   }
};
