params ["_disp"];

private _tex_1 = "#(argb,8,8,3)color(0,0,0,0.0,co)";
private _tex_2 = "#(argb,8,8,3)color(0,0,0,0.0,co)";
private _tex_3 = "#(argb,8,8,3)color(0,0,0,0.0,co)";

switch (_disp) do {
	case "stage 1": {_tex_1 = "images\fob_1.jpg"; _tex_2 = "images\village_1.jpg"; _tex_3 = "images\village_2.jpg"; };
	case "stage 2": {_tex_1 = "images\factory_1.jpg"; _tex_2 = "images\factory_2.jpg"; _tex_3 = "images\factory_3.jpg"; };
	case "stage 3": {_tex_1 = "images\pass_1.jpg"; _tex_2 = "images\pass_2.jpg"; _tex_3 = "images\pass_3.jpg"; };
};

mon_1 setObjectTextureGlobal [0, _tex_1];
mon_2 setObjectTextureGlobal [0, _tex_2];
mon_3 setObjectTextureGlobal [0, _tex_3];
mon_controller setObjectTextureGlobal [1, _tex_1];
mon_controller setObjectTextureGlobal [2, _tex_2];
mon_controller setObjectTextureGlobal [3, _tex_3];