onClipEvent(load){
   mycolor = new Color(this);
   if(_root.myTransform == 0)
   {
      myrgb = {ra:"100",rb:"-47",ga:"100",gb:"-65",ba:"100",bb:"-255",aa:"100",ab:"0"};
   }
   else
   {
      myrgb = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
   }
   mycolor.setTransform(myrgb);
}
