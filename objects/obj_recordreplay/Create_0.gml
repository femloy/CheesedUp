live_auto_call;

if !DEBUG
{
	show_message("No... not yet...");
	instance_destroy();
	exit;
}
with obj_recordreplay
{
	if id != other.id
		instance_destroy();
}

buffer = buffer_create(64, buffer_grow, 1);
time = 0;

prev = {r: -4};

var expect_version = 2;
room_restart();

// header
buffer_write(buffer, buffer_u8, expect_version); // version
buffer_write(buffer, buffer_text, "REP"); // 82 69 80

// modded config
buffer_write(buffer, buffer_u8, global.iteration);
buffer_write(buffer, buffer_bool, global.gameplay);

buffer_write(buffer, buffer_bool, global.uppercut);
buffer_write(buffer, buffer_bool, global.poundjump);
buffer_write(buffer, buffer_u8, global.attackstyle);
buffer_write(buffer, buffer_u8, global.shootstyle);
buffer_write(buffer, buffer_u8, global.doublegrab);
buffer_write(buffer, buffer_u8, global.shootbutton);
buffer_write(buffer, buffer_bool, global.heatmeter);
buffer_write(buffer, buffer_bool, global.swapgrab);
buffer_write(buffer, buffer_u8, global.hitstun);
buffer_write(buffer, buffer_bool, global.banquet);
buffer_write(buffer, buffer_u8, global.vigishoot);
buffer_write(buffer, buffer_u8, global.holidayoverride > -1 ? global.holidayoverride : global.holiday);

buffer_write(buffer, buffer_u8, global.lapmode);
buffer_write(buffer, buffer_bool, global.parrypizzaface);
buffer_write(buffer, buffer_bool, global.lap3checkpoint);
buffer_write(buffer, buffer_u8, global.chasekind);

// player
buffer_write(buffer, buffer_string, obj_player1.character);
buffer_write(buffer, buffer_u8, obj_player1.noisetype);
buffer_write(buffer, buffer_u8, obj_player1.paletteselect);

var pattern;
if global.palettetexture == noone
	pattern = "noone";
else
{
	pattern = sprite_get_name(global.palettetexture);
	pattern = string_replace(pattern, "spr_", "");
	pattern = string_replace(pattern, "pattern_", "");
	pattern = string_replace(pattern, "peppattern", "");
}
buffer_write(buffer, buffer_string, pattern);

// modifiers
var level = global.leveltosave ?? noone;
if level == noone
	level = "noone";
buffer_write(buffer, buffer_string, level);

var modifiers = 0;
modifiers |= MOD.Encore;
modifiers |= MOD.HardMode << 1;
modifiers |= MOD.Mirror << 2;
modifiers |= MOD.JohnGhost << 3;
modifiers |= MOD.Spotlight << 4;
modifiers |= MOD.CosmicClones << 5;
modifiers |= MOD.FromTheTop << 6;
modifiers |= MOD.GravityJump << 7;
modifiers |= MOD.GreenDemon << 8;
modifiers |= MOD.EasyMode << 9;
modifiers |= MOD.DoubleTrouble << 10;
modifiers |= MOD.Hydra << 11;
modifiers |= MOD.OldLevels << 12;
modifiers |= MOD.Ordered << 13;
modifiers |= MOD.SecretInclude << 14;
buffer_write(buffer, buffer_u32, modifiers);

// misc
buffer_write(buffer, buffer_bool, obj_inputAssigner.player_input_device[0] < 0 ? global.keyboard_superjump : global.gamepad_superjump);
buffer_write(buffer, buffer_bool, obj_inputAssigner.player_input_device[0] < 0 ? global.keyboard_groundpound : global.gamepad_groundpound);
