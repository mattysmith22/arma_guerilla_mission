if (player == player_controller) then {
	mission_controller addAction ["Start convoy", {
		params ["_target", "_caller", "_actionID", "_arguments"];
		private _sure = ["Are you sure you would like to start the convoy?", "Are you sure?", true, true] call BIS_fnc_guiMessage;
		if _sure then {
			[] remoteExec ["mbs_fnc_stage3StartConvoy", 2];
			mission_controller removeAction _actionID;
		};
	}];
	mission_controller addAction ["Call RTB", {
		params ["_target", "_caller", "_actionID", "_arguments"];
		private _sure = ["Are you sure you would like to call RTB?", "Are you sure?", true, true] call BIS_fnc_guiMessage;
		if _sure then {
			[] call mbs_fnc_stage3CallRTB;
			if(!isServer) then {
				[] remoteExec ["mbs_fnc_stage3CallRTB", 2];
			};
			mission_controller removeAction _actionID;
		};
	}];
};

if (isServer) then {
	[west, "stage_3_convoy", 
		["Attack the convoy as it drives through the valley", "Attack convoy", "ambush_marker"],
		getMarkerPos "ambush_marker", "CREATED", -1, false] call BIS_fnc_taskCreate;
	{
		_x setMarkerAlpha 1;
	} forEach (getMissionLayerEntities "stage_3" select 1);
};