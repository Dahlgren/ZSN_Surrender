params ["_unit","_weapons","_wpi","_weapon","_wh","_offset","_vel","_dir","_speed"];
_weapons = weaponsItems _unit;
_wpi = _weapons findIf {_x select 0 == currentweapon _unit};
if (_wpi >= 0) then {
	_weapon = _weapons select _wpi;
	_wh = "WeaponHolderSimulated" createVehicle [0,0,0];
	_wh addWeaponWithAttachmentsCargoGlobal [_weapon, 1];
	_offset = _unit selectionPosition "hands";
	_wh disableCollisionWith _unit;
	_vel = velocity _unit;
	_dir = direction _unit;
	_speed = 2;
	_wh setPos (_unit modelToWorld _offset);
	_wh setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)+_speed];
	_unit removeWeapon (_weapon select 0);
	sleep 1;
	if (getpos _wh select 2 < 0) then {_wh setPos [(getPos _wh select 0),(getPos _wh select 1),0.05];};
};