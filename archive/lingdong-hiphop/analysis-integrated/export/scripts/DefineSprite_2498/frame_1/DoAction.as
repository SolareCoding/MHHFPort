function moved(named)
{
   named._x += 1;
   if(named._x >= 507)
   {
      named._x = -543;
   }
}
mov1.onEnterFrame = function()
{
   moved(mov1);
};
mov2.onEnterFrame = function()
{
   moved(mov2);
};
