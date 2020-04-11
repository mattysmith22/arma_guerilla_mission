["tsk_infil_enter_bay", "SUCCEEDED"] call BIS_fnc_taskSetState;

[west, "tsk_infil_main",
	["Our contact is waiting further inland for you to meet them.", "Rendezvous with FIA contact", "infil_main"],
	(getMarkerPos "infil_main"), "AUTOASSIGNED", 3, false, "", true] call BIS_fnc_taskCreate;

_infil_bay_trig = createTrigger ["EmptyDetector", getMarkerPos "infil_main", false];
_infil_bay_trig setTriggerActivation ["WEST", "PRESENT", false];
_infil_bay_trig setTriggerArea [10, 3, 151, true, -1];
_infil_bay_trig setTriggerStatements ["this",
	"[] spawn mbs_fnc_groupHasRVed", ""];