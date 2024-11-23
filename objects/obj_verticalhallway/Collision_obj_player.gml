with (other)
{
	if (state == states.debugstate)
		exit;	
	if (state == states.backtohub)
		exit;
	if (state == states.titlescreen)
		exit;
	if (instance_exists(obj_jumpscare))
		exit;
	
	var hall = other;
	if (!other.savedposition)
	{
		other.savedposition = true;
		other.savedx = x;
		other.savedy = y;
	}
	x = other.savedx;
	y = other.savedy;
	if (!instance_exists(obj_fadeout))
	{
		var _x = x - other.x;
		var _percentage = _x / other.sprite_width;
		vertical_x = _percentage;
		verticalhall_vsp = vsp;
		set_lastroom();
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		verticalhallway = true;
		vhallwaydirection = sign(other.image_yscale);
		hallway = false;
		other.visited = true;
		sound_play("event:/sfx/misc/door");
		with (instance_create(x, y, obj_fadeout))
		{
			offload_arr = hall.offload_arr;
			group_arr = hall.group_arr;
		}
	}
	if (state == states.climbwall)
	{
		//trace("climbwall verticalhallway");
		verticalbuffer = 10;
		verticalstate = states.climbwall;
		var i = 0;
		x = floor(x);
		while (!scr_solid(x + xscale, y))
		{
			x += xscale;
			i++;
			if (i > room_width)
				break;
		}
	}
}
