onClipEvent(load){
   stop();
   if(_parent._parent.ming1 == true)
   {
      var lif = 0;
   }
   else
   {
      var lif = 1;
   }
   var vTime = _root.Time + 100 * lif;
   var vHp = _root.hp;
   var vMaxHp = _root.maxhp;
   var vScore = _parent._parent.s2;
   var vTemp = 0;
   if(vTime >= 100 + _parent.tim)
   {
      vTemp++;
   }
   if(vHp / vMaxHp >= 0.8)
   {
      vTemp++;
   }
   if(vScore >= _parent.score)
   {
      vTemp++;
   }
   this.gotoAndStop(4 - vTemp);
   if(vTemp == 3)
   {
      _root.s += 10000;
      _root.lv_s++;
      _root.hecai.start();
   }
   if(vTemp == 2)
   {
      _root.s += 5000;
      _root.lv_a++;
      _root.x_eat.start();
   }
   if(vTemp == 1)
   {
      _root.lv_b++;
   }
   if(vTemp == 0)
   {
      _root.lv_c++;
   }
}
