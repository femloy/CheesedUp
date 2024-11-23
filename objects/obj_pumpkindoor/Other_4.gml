if (!is_holiday(holiday.halloween) || global.panic) && (seasonal or !cyop)
{
	instance_destroy();
	exit;
}
if quick_ini_read_real("", "halloween", "pumpkincount", 0) < pumpkins && (!global.sandbox or cyop)
{
	instance_destroy();
	with (instance_create(x, y, obj_doorblocked))
	{
	    sprite_index = spr_pumpkingate2;
	    depth = other.depth;
		pumpkins = other.pumpkins;
	}
	exit;
}

event_inherited();
sprite_index = spr_pumpkingate;
