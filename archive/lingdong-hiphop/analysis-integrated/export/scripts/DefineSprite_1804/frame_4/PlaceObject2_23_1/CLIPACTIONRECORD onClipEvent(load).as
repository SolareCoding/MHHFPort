onClipEvent(load){
   this.onEnterFrame = function()
   {
      if(_parent._alpha < 100)
      {
         _parent._alpha += 5;
      }
      else
      {
         delete this.onEnterFrame;
      }
   };
}
