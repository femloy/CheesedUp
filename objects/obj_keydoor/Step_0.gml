var player = instance_place(x, y, obj_player);
if player && !global.horse && !instance_exists(obj_jumpscare) && (player.state == states.normal or player.state == states.ratmount or player.state == states.mach1 or player.state == states.pogo or player.state == states.mach2 or player.state == states.mach3 or player.state == states.Sjumpprep) && sprite_index == spr_locked && player.key_up && player.grounded && global.key_inv
{
	add_saveroom();
	sound_play_3d("event:/sfx/misc/keyunlock", x, y);
	sound_play("event:/sfx/misc/cheers");
	sound_play_3d("event:/sfx/voice/ok");
	
	with obj_player
	{
		x = player.x;
		y = player.y;
		state = states.victory;
		image_index = 0;
		
		if REMIX
		{
			smoothx = x - (other.x + 50);
			x = other.x + 50;
			keydoor = true;
		}
	}
	
	image_index = 0;
	sprite_index = spr_open;
	image_speed = 0.35;
	with instance_create(x + 50, y + 50, obj_lock)
		sprite_index = other.lockspr;
	
	global.key_inv = false;
	
	instance_destroy(obj_spookeyfollow);
	if global.combokeeper
		global.combotime = 60;
}
if floor(image_index) == 2
	image_speed = 0;

if player && !instance_exists(obj_jumpscare) && floor(player.image_index) == player.image_number - 1 && player.state == states.victory
{
	with obj_player
	{
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		instance_create_unique(x, y, obj_fadeout);
	}
}

auto_targetdoor();
