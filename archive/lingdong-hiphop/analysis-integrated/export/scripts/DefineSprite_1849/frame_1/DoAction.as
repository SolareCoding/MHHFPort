_root.pause = 1;
_parent.createEmptyMovieClip("man",100000);
_parent.man._x = 50;
_parent.man._y = -20;
out2 = _parent.man._x + ":" + _parent.man.id + ":" + _parent.man._y;
listener = new Object();
myloader = new MovieClipLoader();
myloader.loadClip("games/data/mhhf_w/" + _root.manSelect + "man.swf",_parent.man);
listener.onLoadProgress = function(target, bytesLoaded, bytesTotal)
{
   outload = int(bytesLoaded / bytesTotal * 100);
   out = "正在载入角色【" + outload + "%】";
   if(outload >= 100)
   {
      _root.yesstart = 1;
   }
};
listener.onLoadError = function(target_mc, errorCode, httpStatus)
{
   out = errorCode + " 错误号:" + httpStatus;
};
myloader.addListener(listener);
onEnterFrame = function()
{
   if(_root.yesstart == 1)
   {
      _visible = false;
      _parent.s_story.st_btn._visible = true;
   }
   else
   {
      _parent.s_story.st_btn._visible = false;
   }
};
