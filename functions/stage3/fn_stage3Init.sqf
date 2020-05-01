(getMissionLayerEntities "stage_3") params ["_stage3Objects", "_stage3Markers"];

if(isServer) then {
	{ _x setMarkerAlpha 0 } forEach (_stage3Markers);
	{
		_x enableSimulationGlobal false;
		_x hideObjectGlobal true;
	} forEach (_stage3Objects);
};