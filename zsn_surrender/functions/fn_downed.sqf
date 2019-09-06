private ["_unit","_ms","_time","_dmg","_hpa"];
_unit = _this select 0;
_ms = _this select 1;
_time = random 3;
_hpa = getAllHitPointsDamage _unit select 2;
_dmg = selectMax _hpa;
_unit setvariable ["ZSN_Dammage", _dmg, true];
if (!(hasInterface && isPlayer _unit)) then {
	if (alive _unit) then {
		if (_dmg > 0.25) then {[_unit, false, _time, _ms] spawn zsn_fnc_recover;};
		_unit setUnconscious true;
		[_unit, "Went down"] remoteexec ["zsn_fnc_hint"];	
		while {(_unit getVariable "ZSN_Dammage" > 0.25) && (lifestate _unit == "INCAPACITATED")} do {
			_unit setSuppression 1;
			_unit setCaptive true;
			_hpa = getAllHitPointsDamage _unit select 2;
			_dmg = selectMax _hpa;
			_unit setvariable ["ZSN_Dammage", _dmg, true];
			sleep _time;
		};
		if (!alive _unit) exitWith {};
		sleep _time;
		_unit setUnconscious false;
		_unit setSuppression 0;
		_unit setCaptive false;
		_unit setvariable ["ZSN_isUnconscious", false, true];
		[_unit, _ms, _time] call zsn_fnc_surrenderCycle;
	};
};