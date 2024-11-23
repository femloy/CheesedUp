msg = "Cheesybot Factory WIP";
targetRoom = oldfactory_0;
level = "oldfactory";
door_index = 3;

sprite_index = spr_gate_industrial;
bgsprite = spr_gate_industrialBG;
title_index = 6;
title_sprite = spr_titlecards_title2;
titlecard_index = 16;

title_music = mu_industrialtitle;
group_arr = ["factorygroup"];

if !global.experimental
	instance_destroy();
