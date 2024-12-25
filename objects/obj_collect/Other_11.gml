/// @description collect
if arena && image_alpha < 1
	exit;

fail_modifier(MOD.NoToppings);
if (object_index != obj_escapecollect or global.blockstyle == BLOCK_STYLES.old)
	scr_sound_multiple(global.snd_collect, x, y);
else
{
	if sprite_index != spr_escapecollect_ss
		scr_sound_multiple("event:/sfx/misc/bellcollect", x, y);
	else
		scr_sound_multiple("event:/modded/sfx/bellcollectSP", x, y);
}

if (obj_player1.character == "V")
	global.playerhealth = clamp(global.playerhealth + 1, 0, 100);
with obj_camera
	healthshaketime = 30;

global.heattime = min(global.heattime + 10, 60);
global.combotime = min(global.combotime + 10, 60);

if !global.snickchallenge
{
	var val = heat_calculate(10);
	global.collect += val;
	create_collect(x, y, sprite_index, val, spr_palette, paletteselect);
	with instance_create(x + 16, y, obj_smallnumber)
		number = string(val);
}

if arena
	image_alpha = 0.35;
else
	instance_destroy();
