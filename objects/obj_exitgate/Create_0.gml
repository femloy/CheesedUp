image_speed = 0;
image_index = 1;
if (room != tower_entrancehall)
	instance_destroy(obj_pigtotal);
if (room == tower_entrancehall)
	alarm[0] = 2;
if (room != rm_editor)
	depth = 50;
random_secret = false;
roomname = room_get_name(room);
global.progress = string_letters(roomname);
drop = false;
drop_y = y;
vsp = 0;
grav = 0.5;
dropstate = states.normal;
hand_y = y - 1000;
handsprite = spr_grabbiehand_idle;
handindex = 0;
uparrow = false;
uparrowID = noone;
snd = false;

if global.blockstyle == BLOCK_STYLES.old
	sprite_index = spr_exitgate_old;

if SUGARY_SPIRE
{
	sugary = SUGARY;
	if sugary
	{
		sprite_index = spr_sugarygateopen;
		image_index = 0;
	}
}
if BO_NOISE
{
	if MIDWAY
		sprite_index = spr_exitgate_bo;
}
