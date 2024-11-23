var closest = swap_closest_follower();
if instance_exists(closest)
{
	playerx = closest.x;
	playery = closest.y;
}
if instance_exists(obj_swapplayergrabbable)
{
	playerx = obj_swapplayergrabbable.x;
	playery = obj_swapplayergrabbable.y;
}
playerx -= camera_get_view_x(view_camera[0]);
playery -= camera_get_view_y(view_camera[0]);

obj_player1.vsp = 0;
obj_player1.hsp = 0;
obj_player1.movespeed = 0;

taunt = false;
dest_x = obj_player1.x - camera_get_view_x(view_camera[0]);
dest_y = obj_player1.y - camera_get_view_y(view_camera[0]);

savedxscale = obj_player1.xscale;
spr_palette = obj_player1.spr_palette;
paletteselect = obj_player1.player_paletteselect[global.swap_index];
patterntexture = obj_player1.player_patterntexture[global.swap_index];

if playerx != dest_x
	image_xscale = sign(dest_x - playerx);
else
	image_xscale = obj_player1.xscale;

buffer = 20;
speedx = abs(playerx - dest_x) / buffer;
speedy = abs(playery - dest_y) / buffer;
sprite = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);

playersprite = obj_player1.spr_swapping;
playerindex = 0;
character = obj_player1.character;
isgustavo = obj_player1.isgustavo;
noisecrusher = obj_player1.noisecrusher;

if isgustavo && character != "N"
{
	spr_palette = spr_peppalette;
	playersprite = spr_player_ratmountattack;
}

var s = 0;
switch character
{
	default: s = isgustavo ? 2 : 0; break;
	case "N": s = 1; break;
}

var snd = fmod_event_create_instance("event:/sfx/voice/swap");
fmod_event_instance_set_parameter(snd, "state", s, true);
fmod_event_instance_play(snd);
fmod_event_instance_release(snd);

instance_destroy(obj_noiseanimatroniceffect);
instance_destroy(obj_swapmodegrab);
instance_destroy(obj_swapplayergrabbable, false);
instance_list = ds_list_create();
sound_list = ds_list_create();
scr_pause_deactivate_objects(false);
instance_deactivate_object(obj_pause);
depth = -999;
