if (player == player_controller) then {
	mission_controller addAction ["Start briefing", {
		params ["_target", "_caller", "_actionID", "_arguments"];
		private _sure = ["Are you sure you would like to start the briefing?", "Are you sure?", true, true] call BIS_fnc_guiMessage;
		if _sure then {
			[] call mbs_fnc_stage1Briefing;
			if !isServer then {
				[] remoteExec ["mbs_fnc_stage1Briefing", 2];
			};
			mission_controller removeAction _actionID;
		};
	}];
};

(getMissionLayerEntities "stage_1") params ["_stage1Objects", "_stage1Markers"];

if(isServer) then {
	{
		_x enableSimulationGlobal true;
		_x hideObjectGlobal false;
	} forEach (_stage1Objects)
};