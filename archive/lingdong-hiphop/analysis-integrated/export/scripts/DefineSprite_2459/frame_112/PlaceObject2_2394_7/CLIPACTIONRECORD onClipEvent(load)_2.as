onClipEvent(load){
   mycolor = new Color(this);
   if(_root.myTransform == 0)
   {
      myrgb = {ra:"100",rb:"-65",ga:"100",gb:"-51",ba:"100",bb:"-126",aa:"80",ab:"0"};
   }
   else
   {
      myrgb = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"0",aa:"80",ab:"0"};
   }
   mycolor.setTransform(myrgb);
}
