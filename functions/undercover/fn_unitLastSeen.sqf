params ["_unit", "_timeout", "_radius"];

private _allSides = [independent, opfor];
private _playerSide = side _unit;
private _enemySides = _allSides; //select {[_playerSide, _x]  call BIS_fnc_sideIsEnemy};

private _infantry = (getPos _unit) nearEntities ["Man", _radius];
private _vehicles = (getPos _unit) nearEntities [["Air", "Ship", "LandVehicle"], _radius];
private _vehicleCrew = (_vehicles apply {crew _x}) call mbs_fnc_arrayConcat ;
_infantry append _vehicleCrew;
_vehicleCrew = nil;
_vehicles = nil;
private _infantry = _infantry select {(side _x) in _enemySides};
private _failLastSeen = -1;

{
	(_x targetKnowledge _unit) params ["_knownGroup", "_knownUnit", "_lastSeenTime","_lastEndangeredTime", "_side", "_perr", "_pos"];
	if ( (_knownGroup || _knownUnit) && ((time - _lastSeenTime) < _timeout)) then {
		_failLastSeen = _lastSeenTime;
	};
} forEach _infantry;
_failLastSeen;