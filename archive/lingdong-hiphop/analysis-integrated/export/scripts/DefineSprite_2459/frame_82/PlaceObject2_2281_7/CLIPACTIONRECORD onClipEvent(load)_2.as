onClipEvent(load){
   mycolor = new Color(this);
   if(_root.myTransform == 0)
   {
      myrgb = {ra:"100",rb:"-163",ga:"100",gb:"-24",ba:"100",bb:"-5",aa:"80",ab:"0"};
   }
   else
   {
      myrgb = {ra:"100",rb:"4",ga:"100",gb:"4",ba:"100",bb:"-51",aa:"80",ab:"0"};
   }
   mycolor.setTransform(myrgb);
}
