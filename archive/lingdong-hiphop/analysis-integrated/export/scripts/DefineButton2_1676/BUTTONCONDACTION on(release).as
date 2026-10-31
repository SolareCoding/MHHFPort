on(release){
   mySave = SharedObject.getLocal("keyset");
   mySave.data.up = _root.up;
   mySave.data.down = _root.down;
   mySave.data.left = _root.left;
   mySave.data.right = _root.right;
   mySave.data.jump = _root.jump;
   mySave.data.atk = _root.atk;
   mySave.data.zt = _root.zt;
   mySave.data.myTransform = _root.myTransform;
   mySave.data.cursor = _root.cursor;
   play();
}
