if (global.gerome or image_index != 0)
{
	if (!uparrow)
	{
		uparrow = true;
		uparrowID = scr_create_uparrowhitbox();
	}
}
else if (uparrow)
{
	uparrow = false;
	instance_destroy(uparrowID);
}

var player = instance_place(x, y, obj_player);
if player && global.gerome && !global.horse && (player.state == states.normal or player.state == states.ratmount or player.state == states.mach1 or player.state == states.pogo or player.state == states.mach2 or player.state == states.mach3 or player.state == states.Sjumpprep) && player.key_up && player.grounded
{
	add_saveroom();
	sound_play_3d("event:/sfx/misc/keyunlock", x, y);
	sound_play("event:/sfx/misc/cheers");
	
	if global.gerome
	{
		if !(SUGARY_SPIRE && sugary)
		{
			obj_geromefollow.visible = false;
			obj_geromefollow.do_end = true;
			
			with instance_create(player.x - 30, player.y, obj_geromeanim)
			{
				sprite_index = spr_gerome_opendoor;
				image_index = 0;
				image_speed = 0.35;
			}
		}
		
		with player
		{
			targetRoom = other.targetRoom;
			targetDoor = other.targetDoor;
			
			state = states.victory;
			image_index = 0;
			
			if REMIX
			{
				smoothx = x - (other.x + 50);
				x = other.x + 50;
			}
		}
		global.gerome = false;
	}
	image_index = 1;
}
if (player && floor(player.image_index) == (player.image_number - 1) && (player.state == states.victory or player.state == states.door))
{
	with (player)
	{
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		if !instance_exists(obj_fadeout)
			instance_create(x, y, obj_fadeout);
	}
}

auto_targetdoor();
