if obj_player.state == states.dead
{
	instance_destroy();
	exit;
}

if !april
{
	with (instance_place(x + spd, y, obj_shotgunblock))
		instance_destroy();
	with (instance_place(x, y - spdh, obj_shotgunblock))
		instance_destroy();
	with (instance_place(x + spd, y, obj_destructibles))
		instance_destroy();
}

var _x = x;
x += image_xscale * spd;
y += -spdh;

if instance_exists(obj_bossplayerdeath)
{
	instance_destroy();
	exit;
}
if (sprite_index == spr_peppinobulletGIANT)
	var dmg = 6;
else
	dmg = 1;

scr_pistolcollision(dmg, _x);
if (sprite_index == spr_peppinobulletGIANT)
	mask_index = sprite_index;

// bump and die
if april && collision_line(x - sign(image_xscale), y, _x + (sign(image_xscale) * 2), y, obj_solid, false, false)
{
	// TODO only works one way
	for(var i = _x; i < x; i++)
	{
		if check_solid(i, y)
		{
			x = i;
			break;
		}
	}
	instance_destroy();
}
