(getMissionLayerEntities "stage_1") params ["_stage1Objects", "_stage1Markers"];

if(isServer) then {
	{ _x setMarkerAlpha 0 } forEach (_stage1Markers);
	{
		_x enableSimulationGlobal false;
		_x hideObjectGlobal true;
	} forEach (_stage1Objects)
	stage_1_fob_reinforcement forceFollowRoad true;
};

stage_1_contact addAction ["Get intel", 
	{
		stage_1_contact globalChat "The officer isn't here yet, but he will be soon. He will be in a black off-road and will come from the south road."
		if (["stage_1_contact"] call BIS_fnc_taskExists) then {
			["stage_1_contact", "SUCCEEDED"] call BIS_fnc_taskSetState;
			[] remoteExec ["mbs_fnc_officerEnterTown", 2, false];
		}
	}];