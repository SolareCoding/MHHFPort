onClipEvent(enterFrame){
   mycolor = new Color(this);
   if(_root.kg02 == 0)
   {
      myrgb = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
   }
   if(_root.kg02 == 1)
   {
      myrgb = {ra:"100",rb:"185",ga:"100",gb:"64",ba:"100",bb:"-98",aa:"100",ab:"0"};
   }
   if(_root.kg02 == 2)
   {
      myrgb = {ra:"100",rb:"-186",ga:"100",gb:"64",ba:"100",bb:"-98",aa:"100",ab:"0"};
   }
   mycolor.setTransform(myrgb);
}
