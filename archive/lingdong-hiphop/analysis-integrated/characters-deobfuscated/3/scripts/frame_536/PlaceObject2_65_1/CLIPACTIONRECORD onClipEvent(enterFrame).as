onClipEvent(enterFrame){
   if(Key.isDown(_root.atk) && _root.atkpress == 0)
   {
      _parent._parent._parent.yinyin.gotoAndPlay("跳踢");
      _parent.gotoAndPlay("跳踢");
   }
}
