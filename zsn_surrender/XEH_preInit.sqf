["ZSN_Surrenderdistance",	"SLIDER",	["Surrender distance","Units will start surrendering when enemies are closer than this"],	["ZluskeN Hors de combat"],[0,1000,200,0],	nil,{params ["_value"]; ZSN_Surrenderdistance = _value;}] call CBA_fnc_addSetting;
["ZSN_Surrendercount",		"SLIDER",	["Surrender count","Units will surrender when they are fewer than this"],					["ZluskeN Hors de combat"],[0,48,3,0],		nil,{params ["_value"]; ZSN_Surrendercount = _value;}] call CBA_fnc_addSetting;
