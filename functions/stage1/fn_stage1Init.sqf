(getMissionLayerEntities "stage_1") params ["_stage1Objects", "_stage1Markers"];

if(isServer) then {
	{ _x setMarkerAlpha 0 } forEach (_stage1Markers);
	{
		_x enableSimulationGlobal false;
		_x hideObjectGlobal true;
	} forEach (_stage1Objects)
};