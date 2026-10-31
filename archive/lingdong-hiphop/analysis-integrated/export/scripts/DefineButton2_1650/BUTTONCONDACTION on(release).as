on(release){
   _root.gameid = _global.gameid;
   getURL("score_list.asp?gameid=" + _root.gameid,"_self");
}
