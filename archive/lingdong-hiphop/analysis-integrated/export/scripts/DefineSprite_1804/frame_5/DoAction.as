stop();
mySave = SharedObject.getLocal("keyset");
_root.up = mySave.data.up;
_root.down = mySave.data.down;
_root.left = mySave.data.left;
_root.right = mySave.data.right;
_root.jump = mySave.data.jump;
_root.atk = mySave.data.atk;
_root.zt = mySave.data.zt;
_root.myTransform = mySave.data.myTransform;
_root.cursor = mySave.data.cursor;
_root.sword_0 = mySave.data.sword_0;
_root.sword_1 = mySave.data.sword_1;
_root.sword_2 = mySave.data.sword_2;
_root.sword_3 = mySave.data.sword_3;
_root.sword_4 = mySave.data.sword_4;
_root.sword_5 = mySave.data.sword_5;
_root.sword_6 = mySave.data.sword_6;
_root.sword_7 = mySave.data.sword_7;
if(_root.up == undefined)
{
   _root.up = 87;
}
if(_root.down == undefined)
{
   _root.down = 83;
}
if(_root.left == undefined)
{
   _root.left = 65;
}
if(_root.right == undefined)
{
   _root.right = 68;
}
if(_root.jump == undefined)
{
   _root.jump = 75;
}
if(_root.atk == undefined)
{
   _root.atk = 74;
}
if(_root.zt == undefined)
{
   _root.zt = 73;
}
if(_root.myTransform == undefined)
{
   _root.myTransform = 0;
}
if(_root.cursor == undefined)
{
   _root.cursor = 1;
}
if(_root.sword_0 == undefined)
{
   _root.sword_0 = 1;
}
if(_root.sword_1 == undefined)
{
   _root.sword_1 = 0;
}
if(_root.sword_2 == undefined)
{
   _root.sword_2 = 0;
}
if(_root.sword_3 == undefined)
{
   _root.sword_3 = 0;
}
if(_root.sword_4 == undefined)
{
   _root.sword_4 = 0;
}
if(_root.sword_5 == undefined)
{
   _root.sword_5 = 0;
}
if(_root.sword_6 == undefined)
{
   _root.sword_6 = 0;
}
if(_root.sword_7 == undefined)
{
   _root.sword_7 = 0;
}
var temp = [_root.up,_root.down,_root.left,_root.right,_root.jump,_root.atk,_root.zt];
temp.sort();
var i = 0;
while(i < 7)
{
   if(temp[i] == temp[i + 1])
   {
      _root.bell.start();
      gotoAndStop("重复");
      play();
   }
   i++;
}
