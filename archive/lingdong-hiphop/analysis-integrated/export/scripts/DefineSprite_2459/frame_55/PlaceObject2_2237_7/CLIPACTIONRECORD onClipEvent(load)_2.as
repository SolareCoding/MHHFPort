onClipEvent(load){
   mycolor = new Color(this);
   if(_root.myTransform == 0)
   {
      myrgb = {ra:"60",rb:"-14",ga:"60",gb:"-19",ba:"60",bb:"0",aa:"80",ab:"0"};
   }
   else
   {
      myrgb = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"0",aa:"80",ab:"0"};
   }
   mycolor.setTransform(myrgb);
}
