[west, "HQ"] sideChat "AAF radio chatter suggests the patrol is setting off now.";

createMarker ["stage_1_patrol_location",(getPos leader stage_1_patrol_group)];
"stage_1_patrol_location" setMarkerType "n_inf";

[stage_1_patrol_group] spawn {
	params ["_stage_1_patrol_group"];
	while {!((units _stage_1_patrol_group select {alive _x}) isEqualTo [])} do {
		"stage_1_patrol_location" setMarkerPos (getPos leader _stage_1_patrol_group);
		sleep 1;
	};
	deleteMarker "stage_1_patrol_location";
	["stage_1_ambush", "SUCCEEDED"] call BIS_fnc_taskSetState;
};

stage_1_patrol_group setBehaviour "SAFE";
private _firstWaypointIndex = (stage_1_patrol_group addWaypoint [getMarkerPos "stage_1_patrol_wp_1", 10]) select 1;
[stage_1_patrol_group, _firstWaypointIndex] setWaypointFormation "COLUMN";
[stage_1_patrol_group, _firstWaypointIndex] setWaypointSpeed "LIMITED";
stage_1_patrol_group addWaypoint [getMarkerPos "stage_1_patrol_wp_2", 10];
stage_1_patrol_group addWaypoint [getMarkerPos "stage_1_patrol_wp_3", 10];
stage_1_patrol_group addWaypoint [getMarkerPos "stage_1_patrol_wp_4", 10];