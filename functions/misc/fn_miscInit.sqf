[] execVM "Convoy\ConvoyInit.sqf";
if (isServer) then {
	["Initialize"] call BIS_fnc_dynamicGroups;
};

if (hasInterface) then {
	["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
}