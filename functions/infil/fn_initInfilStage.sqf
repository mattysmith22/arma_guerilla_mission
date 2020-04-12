if(!isServer) exitWith {""};

createMarker ["respawn_west", getMarkerPos "infil_bay"];
"respawn_west" setMarkerType "Empty";

setDate [2035,07,13,2,00];
0 setFog [0.13,0.07,75];

(getMissionLayerEntities "infil") params ["_objects", "_markers"];

private _enemyInf = _objects select {side _x == independent};
{
	_x enableGunLights "ForceOn";
} forEach _enemyInf;

private _greetingParty = _objects select {side _x == west};
{
	_x setCaptive true;
	[_x, selectRandom ["STAND_U1","STAND_U2","STAND_U3"], "ASIS", objNull, false] call BIS_fnc_ambientAnim;
	_x allowDamage false;
} forEach _greetingParty;

[west, "tsk_infil_enter_bay",
	["The landing zone is in the bay, and has been marked with chemlights. Be careful for contacts in that area.", "Land in the bay", "infil_bay"],
	(getMarkerPos "infil_bay"), "AUTOASSIGNED", 3, true, "", true] call BIS_fnc_taskCreate;

_infil_bay_trig = createTrigger ["EmptyDetector", getMarkerPos "infil_bay", false];
_infil_bay_trig setTriggerActivation ["WEST", "PRESENT", false];
_infil_bay_trig setTriggerArea [100, 10, 136, true, -1];
_infil_bay_trig setTriggerStatements ["this",
	"[] call mbs_fnc_groupHasInfiled", ""];