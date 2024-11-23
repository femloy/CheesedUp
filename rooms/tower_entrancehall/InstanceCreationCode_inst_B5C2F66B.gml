targetRoom = tower_tutorial1;
switch obj_player1.character
{
	case "N": targetRoom = tower_tutorial1N; break;
	case "V": targetRoom = tutorialV_1; break;
}
level = "tutorial";
sprite_index = spr_gate_tutorial;
bgsprite = spr_gate_tutorialBG;
title_index = 1;
titlecard_index = 1;
title_music = "event:/music/w1/medievaltitle";

if global.swapmode
	instance_destroy();
