stop();
_root.gameid = _global.gameid;
var snd = new LoadVars();
var rnd = new LoadVars();
snd.gamescore = _root.s;
snd.gameface = _root.manSelect;
snd.gameid = _global.gameid;
snd.keys = my_code;
snd.sendAndLoad("gets_score.asp",rnd,"POST");
rnd.onLoad = function(success)
{
   if(success)
   {
      isok = rnd.is_ok;
      mypoint = rnd.getpoint;
      if(isok == 0)
      {
         gotoAndStop("nologin");
         play();
      }
      if(isok == 2)
      {
         putout = "获得【" + mypoint + "】点！";
         gotoAndStop("passed");
         play();
      }
      if(isok == 1)
      {
         putout = "成功进入排行！您获得【" + mypoint + "】点！";
         gotoAndStop("passed");
         play();
      }
   }
   else
   {
      gotoAndStop("err");
      play();
   }
};
