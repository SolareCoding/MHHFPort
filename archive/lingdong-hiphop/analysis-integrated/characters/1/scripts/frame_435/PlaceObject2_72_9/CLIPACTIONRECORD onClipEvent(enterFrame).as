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
         if(eval(§§constant(4))[§§constant(5)](e.h) && e[§§constant(6)] == 0)
         {
            if(eval(§§constant(4))[§§constant(5)](e[§§constant(7)]))
            {
               set(§§constant(8),1);
            }
            else if(eval(§§constant(4))[§§constant(5)](e[§§constant(9)]))
            {
               set(§§constant(8),2);
            }
            else
            {
               set(§§constant(8),0);
            }
            g[§§constant(12)](§§constant(11),§§constant(11),eval(§§constant(10)) - 1);
            g[§§constant(11)][§§constant(13)] = eval(§§constant(13));
            g[§§constant(11)][§§constant(10)] = eval(§§constant(10)) - 1;
            g[§§constant(11)][§§constant(14)] = 2;
            set(§§constant(15),true);
            set(§§constant(16),eval(§§constant(10)));
            set(§§constant(17),eval(§§constant(18)));
            e[§§constant(19)][§§constant(20)]();
            §§constant(22)(§§constant(21));
         }
      }
      if(g[§§constant(23)] == false)
      {
         g[§§constant(25)](§§constant(24));
      }
      if(eval(§§constant(4))[§§constant(5)](e[§§constant(26)]) && e[§§constant(27)] == 0 && g[§§constant(23)] == true)
      {
         if(eval(§§constant(4))[§§constant(5)](e[§§constant(7)]) || eval(§§constant(4))[§§constant(5)](e[§§constant(9)]))
         {
            g[§§constant(25)](§§constant(28));
         }
         else
         {
            g[§§constant(25)](§§constant(29));
         }
      }
      with(g)
      {
         if(eval(§§constant(4))[§§constant(5)](e[§§constant(7)]))
         {
            set(§§constant(30),- eval(§§constant(31)));
            set(§§constant(32),1);
         }
         if(eval(§§constant(4))[§§constant(5)](e[§§constant(9)]))
         {
            set(§§constant(30),eval(§§constant(31)));
            set(§§constant(32),0);
         }
      }
   }
}
