if(isServer) then {
	(getMissionLayerEntities "stage_2") params ["_stage2Objects", "_stage2Markers"];
	{ _x setMarkerAlpha 0 } forEach (_stage2Markers);
	{
		_x enableSimulationGlobal false;
		_x hideObjectGlobal true;
	} forEach (_stage2Objects);
};