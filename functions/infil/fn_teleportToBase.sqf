if (!hasInterface) exitWith {nil};

[0, "BLACK", 5] call BIS_fnc_fadeEffect;
player action ["nvGogglesOff", player];
private _tpPos = [[[getMarkerPos "base_marker", 10]],[]] call BIS_fnc_randomPos;
player setPos _tpPos;