(getMissionLayerEntities "stage_2") params ["_objs", "_markers"];

[_objs] call mbs_fnc_deleteObjects;

{
	_x setMarkerAlpha 0;
} forEach _markers;