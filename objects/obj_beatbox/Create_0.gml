init_collision();
vsp = -11;
depth = -3;
playerid = obj_player1;
use_palette = false;

var custom = scr_modding_character(playerid.character);
if custom == noone
	custom = {};
else
{
	sprite_index = custom.sprites.misc[$ "spr_beatbox"] ?? spr_beatbox;
	custom = custom.sounds;
}

var breakdancemusicpath = custom[$ "breakdancemusic"] ?? "event:/sfx/misc/breakdancemusic";
var breakdancepath = custom[$ "breakdance"] ?? "event:/sfx/misc/breakdance";

snd = fmod_event_create_instance(breakdancemusicpath);
switch playerid.character
{
	case "N":
		sprite_index = spr_beatboxN;
		use_palette = true;
		break;
	case "V":
		sprite_index = spr_beatboxV;
		fmod_event_instance_set_parameter(snd, "state", 2, true);
		break;
}

sound_instance_move(snd, x, y);
fmod_event_instance_play(snd);
sound_play_3d(breakdancepath, playerid.x, playerid.y);
