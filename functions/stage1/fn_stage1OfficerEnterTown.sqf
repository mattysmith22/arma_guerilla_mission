private _stage_1_officer_drive_wp = [];
private _stage_1_officer_walk_wp = [];

stage_1_officer assignAsDriver _tank;
[stage_1_officer] orderGetIn true;

waitUntil {vehicle stage_1_officer == stage_1_officer_vehicle};

stage_1_officer_vehicle forceFollowRoad true;
(group stage_1_officer) setBehaviour "SAFE";

{
	(group stage_1_officer) addWaypoint [getMarkerPos _x, 10];
} forEach _stage_1_officer_drive_wp;

private _getOutWaypoint = (group stage_1_officer) addWaypoint [
	getMarkerPos (_stage_1_officer_drive_wp select (count _stage_1_officer_drive_wp - 1)), 20];
_getOutWaypoint setWaypointType "GETOUT"

{
	(group stage_1_officer) addWaypoint [getMarkerPos _x, 10];
} forEach _stage_1_officer_walk_wp;

