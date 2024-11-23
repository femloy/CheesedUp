if global.snickchallenge or global.timeattack
{
	instance_destroy();
	exit;
}

var _start = false;
with (obj_player)
{
	if (object_index != obj_player2 || global.coop)
	{
		if (targetDoor == "S" && (secretportalID == noone or secretportalID == other.ID))
		{
			secretportalID = noone;
			if !instance_exists(obj_secretportalstart)
			{
				x = other.x;
				y = other.y;
				roomstartx = x;
				roomstarty = y;
				with (obj_followcharacter)
				{
					x = other.x;
					y = other.y;
				}
				with (obj_pizzaface)
				{
					x = other.x;
					y = other.y;
				}
				_start = true;
				other.sprite_index = other.spr_close;
				other.image_index = 0;
				instance_destroy(other);
				with instance_create(x, y, obj_secretportalstart)
				{
					active = true;
					visible = true;
				}
			}
		}
	}
}
if in_saveroom()
{
	active = false;
	sprite_index = spr_close;
	visible = false;
	if (!_start)
		instance_destroy(instance_place(x, y, obj_frontcanongoblin_trigger));
	trace("portal active: false");
}
