SS_CODE_START;

enum cardtype
{
	up,
	down,
	left,
	right,
	
	linear,
	interp,
	waving,
	shake,
	none
}

fadealpha = 0;
fadein = 0;
start = false;
step = 0;

// sprite, side it comes from, linear or interp, shake or wave, target x, target y
info =
{
	bginfo: [spr_entrycard_bg, cardtype.left, cardtype.linear, cardtype.none, 0, 0],
	titleinfo: [spr_entrycard_title, cardtype.up, cardtype.interp, cardtype.waving, 672, 160],
	song: "event:/modded/sugary/entrywaytitle"
}

bgX = 0;
bgY = 0;
titleX = 0;
titleY = 0;

group_arr = noone;
title_music = noone;
offload_arr = noone;
loading = false;

event_user(0);

depth = -600;
with obj_gusbrickchase
	fmod_event_instance_stop(snd, true);
with obj_gusbrickfightball
	alarm[1] = -1;

SS_CODE_END;
