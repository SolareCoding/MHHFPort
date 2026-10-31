_parent.attachMovie("item_gj","enemy" + _root.mcID,_root.mcID++);
_parent["enemy" + _root.mcID].id = _root.mcID;
_parent["enemy" + _root.mcID]._x = _X;
_parent["enemy" + _root.mcID]._y = _Y;
hx = random(phit);
if(hx == 1)
{
   _parent["enemy" + _root.mcID].atk = atk * 2;
   _parent["enemy" + _root.mcID].hxyj = 1;
}
else
{
   _parent["enemy" + _root.mcID].atk = atk;
   _parent["enemy" + _root.mcID].hxyj = 0;
}
if(f == 0)
{
   _parent["enemy" + _root.mcID].f = 0;
}
if(f == 1)
{
   _parent["enemy" + _root.mcID].f = 1;
}
