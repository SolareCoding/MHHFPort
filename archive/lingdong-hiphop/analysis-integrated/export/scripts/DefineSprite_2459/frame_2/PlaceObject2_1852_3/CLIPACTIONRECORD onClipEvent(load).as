onClipEvent(load){
   mycolor = new Color(this);
   if(_root.myTransform == 0)
   {
      myrgb = {ra:"78",rb:"-28",ga:"78",gb:"-65",ba:"78",bb:"-167",aa:"100",ab:"0"};
   }
   else
   {
      myrgb = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
      mycolor.setTransform(myrgb);
   }
}
