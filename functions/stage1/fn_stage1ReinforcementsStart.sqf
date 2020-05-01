if (isServer) then {
	[west, "HQ"] sideChat "AAF Radio chatter suggests that an APC is responding to calls for reinforcements from the base. RTB before they arrive.";

	stage_1_fob_reinforcement forceFollowRoad true;
	group driver stage_1_fob_reinforcement addWaypoint [getMarkerPos "enemy_fob", 20];

	[] spawn {
		createMarker ["stage_1_reinforcement", getPos stage_1_fob_reinforcement];
		"stage_1_reinforcement" setMarkerType "n_motor_inf";
		"stage_1_reinforcement" setMarkerText "APC";

		
		while {alive stage_1_fob_reinforcement && !((["stage_1_reinforcement"] call BIS_fnc_taskSetState) in ["SUCCEEDED", "CANCELLED"])} do {
			"stage_1_reinforcement" setMarkerPos getPos stage_1_fob_reinforcement;
			sleep 1;
		};
		deleteMarker "stage_1_reinforcement";
	}
};

if(player == player_controller) then {
	mission_controller addAction ["Call off FOB reinforcements", {
		params ["_target", "_caller", "_actionID", "_arguments"];
		private _sure = ["Are you sure you would like to call off the reinforcements?", "Are you sure?", true, true] call BIS_fnc_guiMessage;
		if _sure then {
			[] remoteExec ["mbs_fnc_stage1CallOffReinforcements", 2, false];
			mission_controller removeAction _actionID;
		};
	}];
};