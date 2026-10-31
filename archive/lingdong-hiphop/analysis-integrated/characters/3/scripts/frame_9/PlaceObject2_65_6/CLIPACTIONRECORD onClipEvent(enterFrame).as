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
      if(h[§§constant(4)](e[§§constant(12)]) && eval(§§constant(10))[§§constant(13)] < e[§§constant(14)])
      {
         with(eval(§§constant(10)))
         {
            set(§§constant(15),eval(§§constant(16)));
            set(§§constant(17),0);
            if(e[§§constant(18)] <= 0 && eval(§§constant(13)) >= e[§§constant(14)] / 2 && eval(§§constant(10))[§§constant(19)][§§constant(13)] > eval(§§constant(10))[§§constant(19)][§§constant(20)])
            {
               set(§§constant(13),eval(§§constant(13)) + 0);
               eval(§§constant(10))[§§constant(19)][§§constant(13)] -= eval(§§constant(21)) * 2;
               eval(§§constant(10))[§§constant(22)][§§constant(13)] -= eval(§§constant(21)) * 3;
               e[§§constant(23)] = 2;
            }
            else
            {
               e[§§constant(23)] = 0;
               set(§§constant(13),eval(§§constant(13)) + eval(§§constant(21)) * 2);
            }
         }
      }
      else
      {
         e[§§constant(23)] = 0;
         eval(§§constant(10))[§§constant(11)](§§constant(24));
      }
      if(h[§§constant(4)](e[§§constant(25)]) && eval(§§constant(10))[§§constant(26)] > e[§§constant(27)])
      {
         with(eval(§§constant(10)))
         {
            set(§§constant(26),eval(§§constant(26)) - eval(§§constant(21)) * 2 / 2);
         }
      }
      if(h[§§constant(4)](e[§§constant(28)]) && eval(§§constant(10))[§§constant(26)] < e[§§constant(29)])
      {
         with(eval(§§constant(10)))
         {
            set(§§constant(26),eval(§§constant(26)) + eval(§§constant(21)) * 2 / 2);
         }
      }
      if(h[§§constant(4)](e.g) && e[§§constant(5)] == 0 && e[§§constant(30)] >= e[§§constant(31)])
      {
         with(eval(§§constant(10)))
         {
            §§constant(11)(§§constant(32));
         }
      }
      else if(h[§§constant(4)](e.g) && e[§§constant(5)] == 0)
      {
         eval(§§constant(10))[§§constant(11)](§§constant(33));
      }
      with(eval(§§constant(10)))
      {
         if(h[§§constant(4)](e[§§constant(6)]) && e[§§constant(7)] == 0)
         {
            set(§§constant(34),2);
            eval(§§constant(10))[§§constant(36)](§§constant(35),§§constant(35),eval(§§constant(26)) - 1);
            eval(§§constant(10))[§§constant(35)][§§constant(13)] = eval(§§constant(13));
            eval(§§constant(10))[§§constant(35)][§§constant(26)] = eval(§§constant(26)) - 1;
            eval(§§constant(10))[§§constant(35)][§§constant(37)] = 2;
            set(§§constant(38),true);
            set(§§constant(39),eval(§§constant(26)));
            set(§§constant(40),eval(§§constant(41)));
            e[§§constant(42)][§§constant(43)]();
            §§constant(45)(§§constant(44));
         }
      }
   }
   else
   {
      eval(§§constant(10))[§§constant(45)](§§constant(24));
   }
}
