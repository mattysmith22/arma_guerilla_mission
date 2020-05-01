(getMissionLayerEntities "stage_3") params ["_stage3Objects", "_stage3Markers"];
if(isServer) then {
	{
		_x enableSimulationGlobal true;
		_x hideObjectGlobal false;
	} forEach (_stage3Objects)
};

if (player == player_controller) then {
	mission_controller addAction ["Start briefing 3", {
		params ["_target", "_caller", "_actionID", "_arguments"];
		private _sure = ["Are you sure you would like to start the briefing 3?", "Are you sure?", true, true] call BIS_fnc_guiMessage;
		if _sure then {
			[] call mbs_fnc_stage3Briefing;
			if !isServer then {
				[] remoteExec ["mbs_fnc_stage3Briefing", 2];
			};
			mission_controller removeAction _actionID;
		};
	}];
};