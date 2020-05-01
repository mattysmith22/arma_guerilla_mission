if(player == player_controller || player == player_controller_2) then {
	mon_controller addAction ["Set Monitor: Blank", "['blank'] call mbs_fnc_setMonitor;"];
	mon_controller addAction ["Set Monitor: Stage 1", "['stage 1'] call mbs_fnc_setMonitor;"];
	mon_controller addAction ["Set Monitor: Stage 2", "['stage 2'] call mbs_fnc_setMonitor;"];
	mon_controller addAction ["Set Monitor: Stage 3", "['stage 3'] call mbs_fnc_setMonitor;"];
}