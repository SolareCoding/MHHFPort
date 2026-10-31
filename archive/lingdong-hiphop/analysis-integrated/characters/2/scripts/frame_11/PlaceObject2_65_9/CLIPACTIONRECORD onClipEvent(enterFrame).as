onClipEvent(enterFrame){
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
   if(e.f == true)
   {
      e.g = 0;
      e.h = 0;
   }
   if(e.f == false)
   {
      with(eval(§§constant(4)))
      {
         set(§§constant(5),80);
         set(§§constant(6),eval(§§constant(6)) + eval(§§constant(7)));
         set(§§constant(8),eval(§§constant(8)) + eval(§§constant(6)));
         if(eval(§§constant(8)) >= eval(§§constant(9)))
         {
            e.g = 0;
            e.h = 0;
            var §§constant(10) = false;
            var §§constant(6) = 0;
            set(§§constant(8),eval(§§constant(9)));
            e[§§constant(11)][§§constant(12)]();
            §§constant(13)();
            eval(§§constant(4))[§§constant(14)][§§constant(15)]();
            §§constant(17)(§§constant(16));
         }
         if(eval(§§constant(18)) == 1 && eval(§§constant(19)) > e[§§constant(20)] && eval(§§constant(21)) == 1 && e[§§constant(22)] == 0)
         {
            if(eval(§§constant(23)) == 2)
            {
               if(eval(§§constant(19)) > eval(§§constant(19)) - (eval(§§constant(5)) + 0))
               {
                  if(e[§§constant(24)] <= 0 && eval(§§constant(19)) <= e[§§constant(25)] / 2 && eval(§§constant(4))[§§constant(26)][§§constant(19)] < eval(§§constant(4))[§§constant(26)][§§constant(27)])
                  {
                     e.g = 2;
                     eval(§§constant(4))[§§constant(26)][§§constant(19)] += eval(§§constant(28)) * 2;
                     eval(§§constant(4))[§§constant(29)][§§constant(19)] += eval(§§constant(28)) * 3;
                  }
                  else
                  {
                     e.g = 0;
                     set(§§constant(19),eval(§§constant(19)) - eval(§§constant(28)) * 2);
                  }
               }
            }
            else if(eval(§§constant(19)) > eval(§§constant(19)) - eval(§§constant(5)))
            {
               if(e[§§constant(24)] <= 0 && eval(§§constant(19)) <= e[§§constant(25)] / 2 && eval(§§constant(4))[§§constant(26)][§§constant(19)] < eval(§§constant(4))[§§constant(26)][§§constant(27)])
               {
                  e.g = 1;
                  eval(§§constant(4))[§§constant(26)][§§constant(19)] += eval(§§constant(28));
                  eval(§§constant(4))[§§constant(29)][§§constant(19)] += eval(§§constant(28)) + 3;
               }
               else
               {
                  e.g = 0;
                  set(§§constant(19),eval(§§constant(19)) - eval(§§constant(28)));
               }
            }
            set(§§constant(30),- eval(§§constant(31)));
         }
         if(eval(§§constant(18)) == 2 && eval(§§constant(19)) < e[§§constant(25)] && eval(§§constant(21)) == 0 && e[§§constant(22)] == 0)
         {
            if(eval(§§constant(23)) == 2)
            {
               if(eval(§§constant(19)) < eval(§§constant(19)) + (eval(§§constant(5)) + 20))
               {
                  if(e[§§constant(24)] <= 0 && eval(§§constant(19)) >= e[§§constant(25)] / 2 && eval(§§constant(4))[§§constant(26)][§§constant(19)] > eval(§§constant(4))[§§constant(26)][§§constant(32)])
                  {
                     e.h = 2;
                     eval(§§constant(4))[§§constant(26)][§§constant(19)] -= eval(§§constant(28)) * 2;
                     eval(§§constant(4))[§§constant(29)][§§constant(19)] -= eval(§§constant(28)) * 3;
                  }
                  else
                  {
                     e.h = 0;
                     set(§§constant(19),eval(§§constant(19)) + eval(§§constant(28)) * 2);
                  }
               }
            }
            else if(eval(§§constant(19)) < eval(§§constant(19)) + eval(§§constant(5)))
            {
               if(e[§§constant(24)] <= 0 && eval(§§constant(19)) >= e[§§constant(25)] / 2 && eval(§§constant(4))[§§constant(26)][§§constant(19)] > eval(§§constant(4))[§§constant(26)][§§constant(32)])
               {
                  e.h = 1;
                  eval(§§constant(4))[§§constant(26)][§§constant(19)] -= eval(§§constant(28));
                  eval(§§constant(4))[§§constant(29)][§§constant(19)] -= eval(§§constant(28)) + 3;
               }
               else
               {
                  e.h = 0;
                  set(§§constant(19),eval(§§constant(19)) + eval(§§constant(28)));
               }
            }
            set(§§constant(30),eval(§§constant(31)));
         }
         if(eval(§§constant(34))[§§constant(35)](e[§§constant(33)]) && eval(§§constant(9)) > e[§§constant(36)] && e[§§constant(22)] == 0)
         {
            if(eval(§§constant(23)) == 2)
            {
               set(§§constant(9),eval(§§constant(9)) - (eval(§§constant(28)) - 2));
               set(§§constant(8),eval(§§constant(8)) - (eval(§§constant(28)) - 2));
            }
            else
            {
               set(§§constant(9),eval(§§constant(9)) - eval(§§constant(28)) / 2);
               set(§§constant(8),eval(§§constant(8)) - eval(§§constant(28)) / 2);
            }
         }
         if(eval(§§constant(34))[§§constant(35)](e[§§constant(37)]) && eval(§§constant(9)) < e[§§constant(38)] && e[§§constant(22)] == 0)
         {
            if(eval(§§constant(23)) == 2)
            {
               set(§§constant(9),eval(§§constant(9)) + (eval(§§constant(28)) - 2));
               set(§§constant(8),eval(§§constant(8)) + (eval(§§constant(28)) - 2));
            }
            else
            {
               set(§§constant(9),eval(§§constant(9)) + eval(§§constant(28)) / 2);
               set(§§constant(8),eval(§§constant(8)) + eval(§§constant(28)) / 2);
            }
         }
      }
   }
}
