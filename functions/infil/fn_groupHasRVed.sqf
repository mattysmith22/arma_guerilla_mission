["tsk_infil_main", "SUCCEEDED"] call BIS_fnc_taskSetState;

[west, "HQ"] sideChat "It is good to see you guys, after we saw the AAF patrols we weren't sure if you were going to make it.";
sleep 2;
[west, "HQ"] sideChat "Hop in and we'll head back to camp";
sleep 6;
"respawn_west" setMarkerPos (getMarkerPos "base_marker");
[] remoteExec ["mbs_fnc_teleportToBase", 0, true];
sleep 10;
setDate [2035,07,13,6,00];
0 setFog [0,0,0];

{ _x setMarkerAlpha 0} forEach (getMissionLayerEntities "infil" select 1);
{ deleteVehicle _x} forEach (getMissionLayerEntities "infil" select 0);
{ _x setMarkerAlpha 1} forEach (getMissionLayerEntities "generalMarkers" select 1);
"base_marker" setMarkerAlpha 1;
[] call mbs_fnc_stage1Start;
if !isServer then {
	[] remoteExec ["mbs_fnc_stage1Start", 2, false];
};
[] remoteExec ["mbs_fnc_revealBase", 0, true];