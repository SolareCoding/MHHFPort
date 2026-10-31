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
      with(g)
      {
         if(eval(§§constant(4))[§§constant(5)](e.h) && eval(§§constant(6)) > e[§§constant(7)] && e[§§constant(8)] == 0)
         {
            §§constant(10)(§§constant(9));
            set(§§constant(11),1);
            if(e[§§constant(12)] <= 0 && eval(§§constant(6)) <= e[§§constant(13)] / 2 && g[§§constant(14)][§§constant(6)] < g[§§constant(14)][§§constant(15)])
            {
               set(§§constant(6),eval(§§constant(6)) - 0);
               g[§§constant(14)][§§constant(6)] += eval(§§constant(16));
               g[§§constant(17)][§§constant(6)] += eval(§§constant(16)) + 3;
               e[§§constant(18)] = 1;
            }
            else
            {
               e[§§constant(18)] = 0;
               set(§§constant(6),eval(§§constant(6)) - eval(§§constant(16)));
            }
            set(§§constant(19),- eval(§§constant(20)));
         }
         else
         {
            e[§§constant(18)] = 0;
         }
         if(eval(§§constant(4))[§§constant(5)](e[§§constant(21)]) && eval(§§constant(6)) < e[§§constant(13)] && e[§§constant(8)] == 0)
         {
            §§constant(10)(§§constant(9));
            set(§§constant(11),0);
            if(e[§§constant(12)] <= 0 && eval(§§constant(6)) >= e[§§constant(13)] / 2 && g[§§constant(14)][§§constant(6)] > g[§§constant(14)][§§constant(22)])
            {
               set(§§constant(6),eval(§§constant(6)) + 0);
               g[§§constant(14)][§§constant(6)] -= eval(§§constant(16));
               g[§§constant(17)][§§constant(6)] -= eval(§§constant(16)) + 3;
               e[§§constant(23)] = 1;
            }
            else
            {
               e[§§constant(23)] = 0;
               set(§§constant(6),eval(§§constant(6)) + eval(§§constant(16)));
            }
            set(§§constant(19),eval(§§constant(20)));
         }
         else
         {
            e[§§constant(23)] = 0;
         }
         if(eval(§§constant(4))[§§constant(5)](e[§§constant(24)]) && eval(§§constant(25)) > e[§§constant(26)] && e[§§constant(8)] == 0)
         {
            §§constant(10)(§§constant(9));
            set(§§constant(25),eval(§§constant(25)) - eval(§§constant(16)) / 2);
         }
         if(eval(§§constant(4))[§§constant(5)](e[§§constant(27)]) && eval(§§constant(25)) < e[§§constant(28)] && e[§§constant(8)] == 0)
         {
            §§constant(10)(§§constant(9));
            set(§§constant(25),eval(§§constant(25)) + eval(§§constant(16)) / 2);
         }
         if(eval(§§constant(4))[§§constant(5)](e[§§constant(29)]) && e[§§constant(30)] == 0 && eval(§§constant(4))[§§constant(5)](e.h) && e[§§constant(31)] == 0 && e[§§constant(8)] == 0)
         {
            §§constant(10)(§§constant(32));
         }
         if(eval(§§constant(4))[§§constant(5)](e[§§constant(29)]) && e[§§constant(30)] == 0 && eval(§§constant(4))[§§constant(5)](e[§§constant(21)]) && e[§§constant(33)] == 0)
         {
            §§constant(10)(§§constant(32));
         }
         if(eval(§§constant(4))[§§constant(5)](e[§§constant(29)]) && e[§§constant(30)] == 0 && eval(§§constant(4))[§§constant(5)](e[§§constant(34)]) && e[§§constant(35)] == 0 && e[§§constant(36)] > 10)
         {
            e[§§constant(36)] -= 10;
            §§constant(10)(§§constant(37));
         }
         else if(eval(§§constant(4))[§§constant(5)](e[§§constant(29)]) && e[§§constant(30)] == 0 && e[§§constant(8)] == 0)
         {
            if(eval(§§constant(38)) == 0)
            {
               e[§§constant(39)]();
               §§constant(10)(§§constant(40));
            }
            if(eval(§§constant(38)) == 1)
            {
               e[§§constant(39)]();
               §§constant(10)(§§constant(41));
            }
            if(eval(§§constant(38)) == 2)
            {
               e[§§constant(39)]();
               §§constant(10)(§§constant(42));
            }
         }
         if(eval(§§constant(4))[§§constant(5)](e[§§constant(34)]) && e[§§constant(35)] == 0)
         {
            if(eval(§§constant(4))[§§constant(5)](e.h))
            {
               set(§§constant(43),1);
            }
            else if(eval(§§constant(4))[§§constant(5)](e[§§constant(21)]))
            {
               set(§§constant(43),2);
            }
            else
            {
               set(§§constant(43),0);
            }
            g[§§constant(45)](§§constant(44),§§constant(44),eval(§§constant(25)) - 1);
            g[§§constant(44)][§§constant(6)] = eval(§§constant(6));
            g[§§constant(44)][§§constant(25)] = eval(§§constant(25)) - 1;
            g[§§constant(44)][§§constant(46)] = 2;
            set(§§constant(47),true);
            set(§§constant(48),eval(§§constant(25)));
            set(§§constant(49),eval(§§constant(50)));
            e[§§constant(51)][§§constant(52)]();
            §§constant(54)(§§constant(53));
         }
      }
   }
}
