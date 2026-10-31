stop();
mycode = new LoadVars();
mycode.load("en_key.asp","POST");
mycode.onLoad = function(success)
{
   if(success)
   {
      my_code = mycode.keys;
      play();
   }
   else
   {
      gotoAndStop("err");
      play();
   }
};
