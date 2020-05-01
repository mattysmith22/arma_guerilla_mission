if isServer then {
	[west, "HQ"] sideChat "Reinforcements show AAF armoured reinforcements coming from the south to retake the supply depot, along with nearby patrols being rerouted. Standby for solution";
	sleep 6;
	[west, "HQ"] sideChat "Surveillance photos shows an AT emplacement on the roof of the primary building, see if you can get access to that.";
	[west, ["stage_2_defend", "stage_2_main"],
		["AAF are inbound to counterattack, defend the outpost", "Defend the outpost", "enemy_fob"],
		getMarkerPos "enemy_depot", "CREATED", -1, true] call BIS_fnc_taskCreate;

	private _reinf_marker_func = {
		params ["_marker", "_obj"];
		createMarker [_marker, _obj];
		_marker setMarkerType "n_mech_inf";
		_marker setMarkerColor "colorGUER";
		while {canMove _obj} do {
			_marker setMarkerPos _obj;
			sleep 2;
		};
		deleteMarker _marker;
	};

	["reinf_1", stage_2_reinforcement_1] spawn _reinf_marker_func;
	["reinf_2", stage_2_reinforcement_2] spawn _reinf_marker_func;
};

if (player == player_controller) then {
	mission_controller addAction ["Complete defend task / RTB", {
		params ["_target", "_caller", "_actionID", "_arguments"];
		private _sure = ["Are you sure you would like to call RTB?", "Are you sure?", true, true] call BIS_fnc_guiMessage;
		if _sure then {
			[] call mbs_fnc_stage2CallRTB;
			if(!isServer) then {
				[] remoteExec ["mbs_fnc_stage2CallRTB", 2];
			};
			mission_controller removeAction _actionID;
		};
	}]
}