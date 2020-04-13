if (isServer) then {
	[west, "stage_1_main", 
		["Prepare us for larger targets by collecting supplies, giving us room to breathe and knocking out enemy command", "Gain footing in the north-west of Altis", "base_marker"],
		objNull, "CREATED", -1, false] call BIS_fnc_taskCreate;
	[west, ["stage_1_raid", "stage_1_main"],
		["An enemy FOB is very close to our base of operations, we need to take it out if we are to roam freely. Communicate to hit the FOB while some of them are on patrol.\nHit hard, hit fast and grab as much supplies as you can.", "Raid the enemy FOB", "enemy_fob"],
		getMarkerPos "enemy_fob", "CREATED", -1, true] call BIS_fnc_taskCreate;
	[west, ["stage_1_ambush", "stage_1_main"],
		["A daily patrol is launched from the FOB to our south, and comes dangerously close to our new HQ. Take them out at the same time as the raid.", "Take out patrol", "stage_1_patrol_loc_2"],
			getMarkerPos "stage_1_patrol_loc_2", "CREATED", -1, true] call BIS_fnc_taskCreate;
	[west, ["stage_1_assassination", "stage_1_main"],
		["The AAF commander is leaving the HQ to interrogate civillians in Oreokastro. This is a perfect opportunity to put a hole in the enemy's chain of command.", "Take out officer", "marker_oreokastro"],
			getMarkerPos "marker_oreokastro", "CREATED", -1, true] call BIS_fnc_taskCreate;
	[west, ["stage_1_contact", "stage_1_assassination"],
		["We have a contact in Oreokastro that can identify the officer, talk to them.", "Get intel", "marker_oreokastro"],
			getPos stage_1_contact, "CREATED", -1, true] call BIS_fnc_taskCreate;
	[west, ["stage_1_boat_infil", "stage_1_assassination"],
		["Take a boat and make your way to the infil point.", "Boat infil", "stage_1_infil"],
			getMarkerPos "stage_1_infil", "CREATED", -1, true] call BIS_fnc_taskCreate;
	{
		_x setMarkerAlpha 1;
	} forEach (getMissionLayerEntities "stage_1" select 1);

	private _outpostCompleteTrigger = createTrigger ["EmptyDetector", getMarkerPos "enemy_fob", false];
	_outpostCompleteTrigger setTriggerArea [100, 100, 0, false, 100];
	_outpostCompleteTrigger setTriggerActivation ["GUER", "NOT PRESENT", false];
	_outpostCompleteTrigger setTriggerStatements ["this",
		"['stage_1_raid', 'SUCCEEDED'] call BIS_fnc_taskSetState;", ""];

	private _infilCompleteTrigger = createTrigger ["EmptyDetector", getMarkerPos "stage_1_infil", false];
	_infilCompleteTrigger setTriggerArea [100, 100, 0, false, 100];
	_infilCompleteTrigger setTriggerActivation ["WEST", "PRESENT", false];
	_infilCompleteTrigger setTriggerStatements ["this", "[] call mbs_fnc_stage1TeamInfil;", ""];
};

if (player == player_controller) then {
	mission_controller addAction ["Start patrol", {
		params ["_target", "_caller", "_actionID", "_arguments"];
		private _sure = ["Are you sure you would like to start the patrol?", "Are you sure?", true, true] call BIS_fnc_guiMessage;
		if _sure then {
			[] remoteExec ["mbs_fnc_stage1PatrolStart", 2];
			mission_controller removeAction _actionID;
		};
	}];
	mission_controller addAction ["Call in FOB reinforcements", {
		params ["_target", "_caller", "_actionID", "_arguments"];
		private _sure = ["Are you sure you would like to start the patrol?", "Are you sure?", true, true] call BIS_fnc_guiMessage;
		if _sure then {
			[] call mbs_fnc_stage1ReinforcementsStart;
			if(!isServer) then {
				[] remoteExec ["mbs_fnc_stage1ReinforcementsStart", 2];
			}
			mission_controller removeAction _actionID;
		};
	}];
};