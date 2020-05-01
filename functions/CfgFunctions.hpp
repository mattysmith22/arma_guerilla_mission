class cfgFunctions
{
	class mbs
	{
		class infil
		{
			class groupHasInfiled {};
			class groupHasRVed {};
			class initInfilStage {postInit = 1; };
			class revealBase {};
			class teleportToBase {};
		};
		class misc
		{
			class arrayConcat {};
			class deleteObjects {};
			class miscInit {postInit = 1; };
		};
		class screens {
			class initScreens {postInit = 1; };
			class setMonitor {};
		}
		class stage1 {
			class stage1Briefing {};
			class stage1CallOffReinforcements {};
			class stage1CallRTB {};
			class stage1Destruct {};
			class stage1Init {postInit = 1; };
			class stage1OfficerEnterTown {};
			class stage1PatrolStart {};
			class stage1ReinforcementsStart {};
			class stage1Start {};
			class stage1TeamInfil {};
		};
		class stage2 {
			class stage2Briefing {};
			class stage2CallRTB {};
			class stage2Destruct {}
			class stage2Init {postInit = 1; };
			class stage2Start {};
			class stage2StartReinforcements {};
		};
		class stage3 {
			class stage3Briefing {};
			class stage3CallRTB {};
			class stage3Destruct {};
			class stage3Init {postInit = 1; };
			class stage3Notif1 {};
			class stage3Notif2 {};
			class stage3Start {};
			class stage3StartConvoy {};
		};
		class undercover
		{
			class initUndercover {postInit = 1; };
			class looksCivillian {};
			class makeUndercover {};
			class shouldGoOvert {};
			class unitLastSeen {};
		};
		class zeus
		{
			class zeusInit {postInit = 1; };
		}
	};
};