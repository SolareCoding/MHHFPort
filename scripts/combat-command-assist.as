// Per-character history; no synthetic key playback and no free ultimates.
this._combatPreviousTick = this.onEnterFrame;
this._combatDownCount = 0;
this._combatQuarterStep = 0;
this._combatLastDown = false;
this._combatLastAttack = false;
this._combatReady = "";
this._combatSkillHeld = [false,false,false,false];
this._combatFollowName = "";
this._combatCommandTick = function() {
  var now = getTimer();
  var down = Key.isDown(_root.down) && !Key.isDown(_root.up);
  var up = Key.isDown(_root.up) && !Key.isDown(_root.down);
  var right = Key.isDown(_root.right);
  var left = Key.isDown(_root.left);
  var attack = Key.isDown(_root.atk);
  var downEdge = down && !this._combatLastDown;
  var attackEdge = attack && !this._combatLastAttack;
  var direct = -1;
  var directNames = ["飞空","鬼步1","龙出前","乱舞前"];
  var directCosts = [_root.b_fk,_root.b_gt1,_root.b_lc,_root.b_lw];
  for (var index = 0; index < 4; index++) {
    var held = Key.isDown(49 + index);
    if (held && !this._combatSkillHeld[index] && direct == -1) direct = index;
    this._combatSkillHeld[index] = held;
  }
  this._combatLastDown = down;
  this._combatLastAttack = attack;
  var phase = this._currentframe;
  var flightPhase = phase >= 111 && phase < 142;
  var sandPhase = phase >= 181 && phase < 195;
  var sandSecondPhase = phase >= 197 && phase < 214;
  if (_root.pause != 0 || _root.hp <= 0) this._combatFollowName = "";
  else {
    if ((direct == 0 && flightPhase) || (direct == 1 && (sandPhase || sandSecondPhase))) {
      this._combatFollowName = direct == 0 ? "飞空2" : (sandPhase ? "鬼步2" : "鬼步3");
      this._combatFollowUntil = now + 600;
      trace("MHHF_SKILL|queue|" + this._combatFollowName);
      direct = -1;
    }
    if (this._combatFollowName != "") {
      var followFlight = this._combatFollowName == "飞空2";
      var followSecond = this._combatFollowName == "鬼步2";
      var followPhase = followFlight ? flightPhase : (followSecond ? sandPhase : sandSecondPhase);
      var earliestFrame = followFlight ? 119 : (followSecond ? 188 : 203);
      if (now > this._combatFollowUntil || !followPhase) this._combatFollowName = "";
      else if (phase >= earliestFrame) {
        var followName = this._combatFollowName;
        this._combatFollowName = "";
        this._combatReady = "";
        this._combatDownCount = 0;
        this._combatQuarterStep = 0;
        _root.dong = 1;
        _root.keyBack();
        trace("MHHF_SKILL|ok|" + followName);
        this.gotoAndPlay(followName);
        return true;
      }
    }
  }
  var neutral = _root.pause == 0 && _root.hp > 0 && !this.inair && this._currentframe < 11 && _root.dong == 0;
  // A child clip may process this same J before the parent's callback.
  // Allow only that just-started ground attack to yield to an armed command.
  var handoff = attackEdge && this._combatWasNeutral && this._combatReady != "" && now <= this._combatReadyUntil && this._currentframe >= 14 && this._currentframe < 238;
  this._combatWasNeutral = neutral;
  // Original standing, walking and running frames are all before frame 11.
  // Do not buffer through jumping, hit stun, another skill, death or pause.
  if (_root.pause != 0 || _root.hp <= 0 || this.inair || (this._currentframe >= 11 && !handoff) || (_root.dong != 0 && !handoff)) {
    if (direct >= 0) trace("MHHF_SKILL|busy|" + directNames[direct]);
    this._combatDownCount = 0;
    this._combatQuarterStep = 0;
    this._combatReady = "";
    return false;
  }
  if (direct >= 0) {
    this._combatReady = "";
    this._combatDownCount = 0;
    this._combatQuarterStep = 0;
    if (_root.mp < directCosts[direct]) {
      trace("MHHF_SKILL|mp|" + directNames[direct] + "|" + directCosts[direct] + "|" + _root.mp);
      return false;
    }
    _root.dong = 1;
    _root.keyBack();
    trace("MHHF_SKILL|ok|" + directNames[direct]);
    this.gotoAndPlay(directNames[direct]);
    return true;
  }
  if (now - this._combatDownTime > 750) this._combatDownCount = 0;
  if (now - this._combatQuarterTime > 750) this._combatQuarterStep = 0;
  if (now > this._combatReadyUntil) this._combatReady = "";
  if (downEdge) {
    this._combatDownCount++;
    if (this._combatDownCount > 2) this._combatDownCount = 1;
    this._combatDownTime = now;
  }
  if (up && this._combatDownCount == 2) {
    this._combatReady = "龙出前";
    this._combatReadyUntil = now + 450;
    this._combatDownCount = 0;
  }
  var side = !down && !up && right != left ? (right ? 1 : -1) : 0;
  if (up) this._combatQuarterStep = 0;
  if (downEdge) {
    if (this._combatQuarterStep == 2) this._combatQuarterStep = 3;
    else this._combatQuarterStep = 1;
    this._combatQuarterTime = now;
  } else if (side != 0) {
    if (this._combatQuarterStep == 1) {
      this._combatQuarterSide = side;
      this._combatQuarterStep = 2;
      this._combatQuarterTime = now;
    } else if (this._combatQuarterStep == 3) {
      if (side == this._combatQuarterSide) {
        this._combatReady = "乱舞前";
        this._combatReadyUntil = now + 450;
        this._combatQuarterStep = 0;
      } else this._combatQuarterStep = 0;
    }
  }
  if (attackEdge && this._combatReady != "" && now <= this._combatReadyUntil) {
    var name = this._combatReady;
    var cost = name == "龙出前" ? _root.b_lc : _root.b_lw;
    this._combatReady = "";
    this._combatDownCount = 0;
    this._combatQuarterStep = 0;
    if (_root.mp >= cost) {
      _root.dong = 1;
      _root.keyBack();
      this.gotoAndPlay(name);
      return true;
    }
  }
  return false;
};
this.onEnterFrame = function() {
  if (!this._combatCommandTick()) this._combatPreviousTick();
};
