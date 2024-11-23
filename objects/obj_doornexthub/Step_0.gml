var _save = false;
var player = instance_place(x, y, obj_player);

if (player && key && (player.state == states.normal or player.state == states.ratmount or player.state == states.mach1 or player.state == states.pogo or player.state == states.mach2 or player.state == states.mach3 or player.state == states.Sjumpprep) && sprite_index == spr_elevatorlocked && player.key_up && player.grounded)
{
	_save = true;
	add_saveroom();
	image_index = 0;
	sprite_index = spr_elevatoropening;
	sound_play_3d("event:/sfx/misc/elevatorstart", x, y);
	sound_play_3d("event:/sfx/misc/keyunlock", x, y);
	image_speed = 0.35;
	with (instance_create(x + 50, y + 50, obj_lock))
		sprite_index = spr_elevatorlock;
	global.key_inv = false;
	instance_destroy(obj_giantkeyfollow);
	
	with obj_player
	{
		state = states.victory;
		image_index = 0;
		x = player.x;
		y = player.y;
		sprite_index = isgustavo ? spr_ratmountvictory : spr_victory;
		
		if REMIX
		{
			smoothx = x - (other.x + 50);
			x = other.x + 50;
			keydoor = true;
		}
	}
}
if (floor(image_index) == (image_number - 1))
	image_index = image_number - 1;
if (_save)
{
	unlocked = true;
	ini_open_from_string(obj_savesystem.ini_str);
	ini_write_real(save, "door", true);
	obj_savesystem.ini_str = ini_close();
	gamesave_async_save();
}
if (sprite_index == spr_elevatoropening && floor(image_index) == (image_number - 1) && player && !instance_exists(obj_jumpscare) && floor(player.image_index) == (player.image_number - 1) && player.state == states.victory)
{
	with (obj_player)
	{
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		instance_create_unique(x, y, obj_fadeout);
	}
}

auto_targetdoor();
