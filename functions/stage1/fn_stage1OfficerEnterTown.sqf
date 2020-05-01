private _stage_1_officer_drive_wp = ["stage_1_officer_drive_wp_1", "stage_1_officer_drive_wp_2", "stage_1_officer_drive_wp_3","stage_1_officer_drive_wp_4"];

private _stage_1_officer_walk_wp = ["stage_1_officer_walk_wp_1","stage_1_officer_walk_wp_2","stage_1_officer_walk_wp_3","stage_1_officer_walk_wp_4","stage_1_officer_walk_wp_5","stage_1_officer_walk_wp_6","stage_1_officer_walk_wp_7"];

group stage_1_officer setSpeedMode "LIMITED";
stage_1_officer assignAsDriver stage_1_officer_vehicle;
[stage_1_officer] orderGetIn true;

waitUntil {vehicle stage_1_officer == stage_1_officer_vehicle};

stage_1_officer_vehicle forceFollowRoad true;
(group stage_1_officer) setBehaviour "SAFE";

{
	(group stage_1_officer) addWaypoint [getMarkerPos _x, 10];
} forEach _stage_1_officer_drive_wp;

private _stage_1_waypoints = waypoints group stage_1_officer;
(_stage_1_waypoints select (count _stage_1_waypoints - 1)) setWaypointStatements["this", "stage_1_officer_vehicle forceFollowRoad false;", ""];
private _getOutWaypoint = (group stage_1_officer) addWaypoint [
	getMarkerPos (_stage_1_officer_drive_wp select (count _stage_1_officer_drive_wp - 1)), 20];
_getOutWaypoint setWaypointType "GETOUT";

{
	(group stage_1_officer) addWaypoint [getMarkerPos _x, 10];
} forEach _stage_1_officer_walk_wp;

