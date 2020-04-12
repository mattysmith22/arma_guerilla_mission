params ["_unit"];

{
	if(local _x) then {
		_x forgetTarget _unit;
	};
} forEach allGroups;