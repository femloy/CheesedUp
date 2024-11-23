live_auto_call;

if !DEBUG
{
	show_message("No... not yet...");
	instance_destroy();
	exit;
}

instance_destroy(obj_recordreplay);
with obj_replay
{
	if id != other.id
		instance_destroy();
}

replay_error = function(str)
{
	show_message(str);
	return 0;
}
init_input = function()
{
	key_up = false;
	key_up2 = false;
	key_right = false;
	key_right2 = false;
	key_left = false;
	key_left2 = false;
	key_down = false;
	key_down2 = false;
	key_jump = false;
	key_jump2 = false;
	key_slap = false;
	key_slap2 = false;
	key_taunt = false;
	key_taunt2 = false;
	key_attack = false;
	key_attack2 = false;
	key_chainsaw = false;
	key_chainsaw2 = false;
	key_shoot = false;
	key_shoot2 = false;
	key_superjump = false;
	key_groundpound = false;
	key_groundpound2 = false;
	key_left_axis = false;
	key_right_axis = false;
	key_up_axis = false;
	key_down_axis = false;
}
init_input();

check_bit = function(v, pos)
{
	return (v >> pos) & 1;
}

var file = get_open_filename("Replays|*.bin", "");
if file == ""
{
	instance_destroy();
	exit;
}

buffer = buffer_load(file);
time = 0;

var expect_version = 2;

// header
var version = buffer_read(buffer, buffer_u8);

var header_check = buffer_read(buffer, buffer_u8) == 82;
header_check |= buffer_read(buffer, buffer_u8) == 69;
header_check |= buffer_read(buffer, buffer_u8) == 80;

if !header_check
	return replay_error("This is not a valid replay file!");
if version != expect_version
	return replay_error($"This replay is outdated.\nGame physics change between versions, so it's incompatible.\n\n(Got {version}, I'm on {expect_version}!)");

// modded config

// buffer_write\(buffer, (buffer_.+), (.+)\)
// ->
// $2 = buffer_read\(buffer, $1\)

global.iteration = buffer_read(buffer, buffer_u8);
global.gameplay = buffer_read(buffer, buffer_bool);

global.uppercut = buffer_read(buffer, buffer_bool);
global.poundjump = buffer_read(buffer, buffer_bool);
global.attackstyle = buffer_read(buffer, buffer_u8);
global.shootstyle = buffer_read(buffer, buffer_u8);
global.doublegrab = buffer_read(buffer, buffer_u8);
global.shootbutton = buffer_read(buffer, buffer_u8);
global.heatmeter = buffer_read(buffer, buffer_bool);
global.swapgrab = buffer_read(buffer, buffer_bool);
global.hitstun = buffer_read(buffer, buffer_u8);
global.banquet = buffer_read(buffer, buffer_bool);
global.vigishoot = buffer_read(buffer, buffer_u8);
global.holidayoverride = buffer_read(buffer, buffer_u8);

global.lapmode = buffer_read(buffer, buffer_u8);
global.parrypizzaface = buffer_read(buffer, buffer_bool);
global.lap3checkpoint = buffer_read(buffer, buffer_bool);
global.chasekind = buffer_read(buffer, buffer_u8);

// player
with obj_player
{
	character = buffer_read(other.buffer, buffer_string);
	noisetype = buffer_read(other.buffer, buffer_bool);
	player_paletteselect[player_index] = buffer_read(other.buffer, buffer_u8);
}

var pattern = buffer_read(buffer, buffer_string);
if pattern == "noone"
	global.palettetexture = noone;
else if string_is_number(pattern)
	global.palettetexture = asset_get_index($"spr_peppattern{pattern}");
else
	global.palettetexture = asset_get_index($"spr_pattern_{pattern}");

// modifiers

// modifiers \|= (.+) << (\d+)
// ->
// $1 = check_bit\(modifiers, $2\)

var level = buffer_read(buffer, buffer_string);
if level == "noone"
	global.leveltosave = noone;
else
	global.leveltosave = level;

var modifiers = buffer_read(buffer, buffer_u32);
MOD.Encore = check_bit(modifiers, 0);
MOD.HardMode = check_bit(modifiers, 1);
MOD.Mirror = check_bit(modifiers, 2);
MOD.JohnGhost = check_bit(modifiers, 3);
MOD.Spotlight = check_bit(modifiers, 4);
MOD.CosmicClones = check_bit(modifiers, 5);
MOD.FromTheTop = check_bit(modifiers, 6);
MOD.GravityJump = check_bit(modifiers, 7);
MOD.GreenDemon = check_bit(modifiers, 8);
MOD.EasyMode = check_bit(modifiers, 9);
MOD.DoubleTrouble = check_bit(modifiers, 10);
MOD.Hydra = check_bit(modifiers, 11);
MOD.OldLevels = check_bit(modifiers, 12);
MOD.Ordered = check_bit(modifiers, 13);
MOD.SecretInclude = check_bit(modifiers, 14);

trace(MOD);

// misc
superjump = buffer_read(buffer, buffer_bool);
groundpound = buffer_read(buffer, buffer_bool);

// player
first = false;
read_player = function(ignore = false)
{
	ignore = first;
	first = true;
	
	var r = buffer_read(buffer, buffer_string);
	if asset_get_type(r) == asset_room && !ignore
	{
		r = asset_get_index(r);
		room_goto(r);
	}
	
	var stat = buffer_read(buffer, buffer_u16);
	var xs = buffer_read(buffer, buffer_bool) ? 1 : -1;
	var xx = buffer_read(buffer, buffer_s32);
	var yy = buffer_read(buffer, buffer_s32);
	
	if !ignore
	with obj_player
	{
		x = xx;
		y = yy;
		xscale = xs;
		state = stat;
	}
}
