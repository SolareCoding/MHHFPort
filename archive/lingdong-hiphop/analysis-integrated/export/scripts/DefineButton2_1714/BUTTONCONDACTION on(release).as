on(release){
   mySave = SharedObject.getLocal("keyset");
   mySave.clear();
   mySave.flush();
   gotoAndStop("复位");
   play();
}
