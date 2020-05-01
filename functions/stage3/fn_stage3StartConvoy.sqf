if(isServer) then {
	_handle = [["cv0_wp0","cv0_wp1","cv0_wp2","cv0_wp3"],[cv0_v0,cv0_v1,cv0_v2,cv0_v3,cv0_v4], 50, 500, 1, "NORMAL", "CARELESS"] spawn DEVAS_ConvoyMove;

	_notif_1_trig = createTrigger ["EmptyDetector", getMarkerPos "cv0_wp0", false];
	_notif_1_trig setTriggerActivation ["GUER", "PRESENT", false];
	_notif_1_trig setTriggerArea [50, 50, 136, true, -1];
	_notif_1_trig setTriggerStatements ["this",
		"[] call mbs_fnc_stage3Notif1;", ""];
	
	_notif_2_trig = createTrigger ["EmptyDetector", getMarkerPos "cv0_wp1", false];
	_notif_2_trig setTriggerActivation ["GUER", "PRESENT", false];
	_notif_2_trig setTriggerArea [50, 50, 136, true, -1];
	_notif_2_trig setTriggerStatements ["this",
		"[] call mbs_fnc_stage3Notif2;", ""];
};