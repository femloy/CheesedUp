var exists = false;
with (obj_teleporter)
{
	if (trigger == other.trigger && start != 1 && id != other.id)
	{
		exists = true;
		other.player.x = x;
		other.player.y = y - 20;
		
		if start == 2
			cooldown = 100;
	}
}

if !exists && !instance_exists(obj_cyop_loader)
{
	player.x = player.roomstartx;
	player.y = player.roomstarty;
}

if start == 2
	cooldown = 100;
alarm[1] = 10;
