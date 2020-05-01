if (player == player_controller) then {
	mission_controller addAction ["Start depot reinforcements", {
		params ["_target", "_caller", "_actionID", "_arguments"];
		private _sure = ["Are you sure you would like to start the APC reinforcments?", "Are you sure?", true, true] call BIS_fnc_guiMessage;
		if _sure then {
			if(!isServer) then {
				[] call mbs_fnc_stage2StartReinforcements;
			};
			[] remoteExec ["mbs_fnc_stage2StartReinforcements", 2];
			mission_controller removeAction _actionID;
		};
	}];
};

if (isServer) then {
	[west, "stage_2_main", 
		["Gather us some more supplies to allow for us to hit heavier targets", "Secure supplies", "enemy_depot"],
		getMarkerPos "enemy_depot", "CREATED", -1, false] call BIS_fnc_taskCreate;
	{
		_x setMarkerAlpha 1;
	} forEach (getMissionLayerEntities "stage_2" select 1);
};