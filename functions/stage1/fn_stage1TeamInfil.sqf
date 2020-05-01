['stage_1_boat_infil', 'SUCCEEDED'] call BIS_fnc_taskSetState;
[west, ["stage_1_team_set_up", "stage_1_assassination"],
	["Set up at the snipers nest.", "Set up", "stage_1_snipers_nest"],
		getMarkerPos "stage_1_snipers_nest", "CREATED", -1, true] call BIS_fnc_taskCreate;

private _infilCompleteTrigger = createTrigger ["EmptyDetector", getMarkerPos "stage_1_snipers_nest", false];
_infilCompleteTrigger setTriggerArea [50, 50, 0, false, -1];
_infilCompleteTrigger setTriggerActivation ["WEST", "PRESENT", false];
_infilCompleteTrigger setTriggerStatements ["this", "['stage_1_team_set_up', 'SUCCEEDED'] call BIS_fnc_taskSetState;", ""];