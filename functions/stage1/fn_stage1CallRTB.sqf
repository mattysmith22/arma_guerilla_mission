if(isserver) then {
	['stage_1_main', 'SUCCEEDED'] call BIS_fnc_taskSetState;
	[west, "stage_1_rtb",
		["Good job! Return to base for next tasking.", "RTB", "base_marker"],
			getMarkerPos "base_marker", "AUTOASSIGNED", -1, true] call BIS_fnc_taskCreate;
};

if(player == player_controller) then {
	mission_controller addAction ["Complete RTB", {
		params ["_target", "_caller", "_actionID", "_arguments"];
		private _sure = ["Are you sure you would complete RTB?", "Are you sure?", true, true] call BIS_fnc_guiMessage;
		if _sure then {
			['stage_1_rtb', 'SUCCEEDED'] call BIS_fnc_taskSetState;
			[] call mbs_fnc_stage1Destruct;
			if(!isServer) then {
				[] remoteExec ["mbs_fnc_stage1Destruct", 2, false];
			};
			mission_controller removeAction _actionID;
		};
	}];
};

[] call mbs_fnc_stage2Start;