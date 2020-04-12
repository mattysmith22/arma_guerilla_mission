params ["_unit"];

if !(primaryWeapon player == "" || secondaryWeapon player == "" || handgunWeapon player == "") exitWith {[false, "You are holding a weapon"]};

if !(vest _unit == "") exitWith  {[false, format ["You are wearing a vest: %1", vest _unit]]};

private _inVehicle = vehicle _unit != _unit;
private _vehIsCiv = getNumber (configFile >> "cfgVehicles" >> typeOf (vehicle _unit) >> "side") == (civilian call BIS_fnc_sideID);

if (_inVehicle && !_vehIsCiv) exitWith {[false, "You are in a non-civilian vehicle"]};

[true, ""];