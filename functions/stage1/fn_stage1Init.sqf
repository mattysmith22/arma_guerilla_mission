(getMissionLayerEntities "stage_1") params ["_stage1Objects", "_stage1Markers"];
stage_1_contact addAction ["Get intel", 
{
	stage_1_contact globalChat "The officer isn't here yet, but he will be soon. He will be in a green off-road and will come from the main road.";
	if (["stage_1_contact"] call BIS_fnc_taskExists) then {
		["stage_1_contact", "SUCCEEDED"] call BIS_fnc_taskSetState;
		[] remoteExec ["mbs_fnc_stage1OfficerEnterTown", 2, false];
	};
},nil, 1.5,true,true,"","true",3];

if(isServer) then {
	{ _x setMarkerAlpha 0 } forEach (_stage1Markers);
	{
		_x enableSimulationGlobal false;
		_x hideObjectGlobal true;
	} forEach (_stage1Objects);
	stage_1_fob_reinforcement forceFollowRoad true;
};
