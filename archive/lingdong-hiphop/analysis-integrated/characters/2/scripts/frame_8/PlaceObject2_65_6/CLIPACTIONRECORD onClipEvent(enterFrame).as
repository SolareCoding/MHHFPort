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
   if(e.f == 0)
   {
      if(h[§§constant(4)](e.g) && e[§§constant(5)] == 0 && h[§§constant(4)](e[§§constant(6)]) && e[§§constant(7)] == 0 && e[§§constant(8)] > 10)
      {
         e[§§constant(8)] -= 10;
         eval(§§constant(10))[§§constant(11)](§§constant(9));
      }
      if(h[§§constant(4)](e[§§constant(12)]) && eval(§§constant(10))[§§constant(13)] > e[§§constant(14)])
      {
         with(eval(§§constant(10)))
         {
            set(§§constant(15),- eval(§§constant(16)));
            set(§§constant(17),1);
            if(e[§§constant(18)] <= 0 && eval(§§constant(13)) <= e[§§constant(19)] / 2 && eval(§§constant(10))[§§constant(20)][§§constant(13)] < eval(§§constant(10))[§§constant(20)][§§constant(21)])
            {
               set(§§constant(13),eval(§§constant(13)) - 0);
               eval(§§constant(10))[§§constant(20)][§§constant(13)] += eval(§§constant(22)) * 2;
               eval(§§constant(10))[§§constant(23)][§§constant(13)] += eval(§§constant(22)) * 3;
               e[§§constant(24)] = 2;
            }
            else
            {
               e[§§constant(24)] = 0;
               set(§§constant(13),eval(§§constant(13)) - eval(§§constant(22)) * 2);
            }
         }
      }
      else
      {
         e[§§constant(24)] = 0;
         eval(§§constant(10))[§§constant(11)](§§constant(25));
      }
      if(h[§§constant(4)](e[§§constant(26)]) && eval(§§constant(10))[§§constant(27)] > e[§§constant(28)])
      {
         with(eval(§§constant(10)))
         {
            set(§§constant(27),eval(§§constant(27)) - eval(§§constant(22)) * 2 / 2);
         }
      }
      if(h[§§constant(4)](e[§§constant(29)]) && eval(§§constant(10))[§§constant(27)] < e[§§constant(30)])
      {
         with(eval(§§constant(10)))
         {
            set(§§constant(27),eval(§§constant(27)) + eval(§§constant(22)) * 2 / 2);
         }
      }
      if(h[§§constant(4)](e.g) && e[§§constant(5)] == 0 && e[§§constant(31)] >= e[§§constant(32)])
      {
         with(eval(§§constant(10)))
         {
            §§constant(11)(§§constant(33));
         }
      }
      else if(h[§§constant(4)](e.g) && e[§§constant(5)] == 0)
      {
         eval(§§constant(10))[§§constant(11)](§§constant(34));
      }
      with(eval(§§constant(10)))
      {
         if(h[§§constant(4)](e[§§constant(6)]) && e[§§constant(7)] == 0)
         {
            set(§§constant(35),1);
            eval(§§constant(10))[§§constant(37)](§§constant(36),§§constant(36),eval(§§constant(27)) - 1);
            eval(§§constant(10))[§§constant(36)][§§constant(13)] = eval(§§constant(13));
            eval(§§constant(10))[§§constant(36)][§§constant(27)] = eval(§§constant(27)) - 1;
            eval(§§constant(10))[§§constant(36)][§§constant(38)] = 2;
            set(§§constant(39),true);
            set(§§constant(40),eval(§§constant(27)));
            set(§§constant(41),eval(§§constant(42)));
            e[§§constant(43)][§§constant(44)]();
            §§constant(46)(§§constant(45));
         }
      }
   }
   else
   {
      eval(§§constant(10))[§§constant(46)](§§constant(25));
   }
}
