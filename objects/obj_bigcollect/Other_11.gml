/// @description collect
if arena && image_alpha < 1
	exit;

fail_modifier(MOD.NoToppings);
if sprite_index != spr_escapecollectbig_ss
{
	if global.snd_collectpizza == global.snd_collect
		scr_sound_multiple(global.snd_collectpizza, x, y);
	else
		sound_play(global.snd_collectpizza);
}
if object_index == obj_escapecollectbig
{
	if sprite_index != spr_escapecollectbig_ss
		sound_play_3d("event:/sfx/misc/bellcollectbig", x, y);
	else
		sound_play_3d("event:/modded/sfx/bellcollectbig_ss", x, y);
}

if (obj_player1.character == "V")
	global.playerhealth = clamp(global.playerhealth + 10, 0, 100);
with obj_camera
	healthshaketime = 60;

global.heattime = 60;
global.combotime = 60;
	
if !global.snickchallenge
{
	var val = heat_calculate(value);
	global.collect += val;
	if (visible)
		create_collect(x, y, sprite_index, val);
	with (instance_create(x + 16, y, obj_smallnumber))
		number = string(val);
	tv_do_expression(spr_tv_exprcollect);
}

if arena
	image_alpha = 0.35;
else
	instance_destroy();
