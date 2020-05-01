params ["_objs"];

private _base = getMarkerPos "base_marker";
{
	{
		if (_x distance2D _base > 300) then 
		{
			deleteVehicle _x
		};
	} forEach crew _x + [_x];
} forEach _objs;