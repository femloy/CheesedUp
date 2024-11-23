if april && !global.panic
	exit;

add_saveroom();
global.gerome = true;
sound_play_3d(SUGARY ? "event:/modded/sfx/collecttoppinSP" : "event:/sfx/voice/geromegot", x, y);
if april
	global.stylelock = true;
global.combotime = 60;
instance_create(x, y, obj_geromefollow);
instance_create(x, y, obj_baddietaunteffect);
instance_destroy();

if sprite_index == spr_gerome_idle_ss
	tv_do_expression(spr_tv_exprrudejanitor);
