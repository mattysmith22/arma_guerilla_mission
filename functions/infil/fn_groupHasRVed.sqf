["tsk_infil_main", "SUCCEEDED"] call BIS_fnc_taskSetState;

infil_fia_contact sideChat "It is good to see you guys, after we saw the AAF patrols we weren't sure if you were going to make it.";
sleep 2;
infil_fia_contact sideChat "Hop in and we'll head back to camp";
sleep 6;
"respawn_west" setMarkerPos (getMarkerPos "base_marker");
[] remoteExec ["mbs_fnc_teleportToBase", 0, true];
sleep 10;
setDate [2035,07,13,6,00];
0 setFog [0,0,0];
[] remoteExec ["mbs_fnc_revealBase", 0, true];