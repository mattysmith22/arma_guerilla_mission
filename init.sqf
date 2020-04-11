[] call compile preprocessFileLineNumbers "Convoy\ConvoyInit.sqf";
if(isServer) then {
	//_handle = [["cv0_wp0","cv0_wp1"],[cv0_v0,cv0_v1,cv0_v2,cv0_v3,cv0_v4], 35, 500, 1, "NORMAL", "CARELESS"] spawn DEVAS_ConvoyMove; 
};