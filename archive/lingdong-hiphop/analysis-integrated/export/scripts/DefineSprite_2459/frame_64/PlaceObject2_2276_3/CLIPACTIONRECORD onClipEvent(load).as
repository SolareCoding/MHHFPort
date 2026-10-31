onClipEvent(load){
   mycolor = new Color(this);
   if(_root.myTransform == 0)
   {
      myrgb = {ra:"100",rb:"-130",ga:"100",gb:"-79",ba:"100",bb:"-38",aa:"100",ab:"0"};
   }
   else
   {
      myrgb = {ra:"100",rb:"51",ga:"100",gb:"55",ba:"100",bb:"-38",aa:"100",ab:"0"};
   }
   mycolor.setTransform(myrgb);
}
