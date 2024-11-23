if (room == rm_editor)
	exit;

spr_palette = noone;
paletteselect = 0;
scr_collectspr();
image_speed = 0.35;
global.collected = false;
global.collectsound = 0;
depth = 11;
gotowardsplayer = false;
movespeed = 5;

// AFOM
arena = false;
