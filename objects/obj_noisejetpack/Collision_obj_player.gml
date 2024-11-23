if instance_exists(obj_genericdeath)
	exit;

if (state == states.normal && other.grounded)
{
	depth = -500;
	add_saveroom();
	playerid = other.id;
	x = other.x;
	y = other.y - 60;
	state = states.gottreasure;
	cutscenebuffer = 40;
	effectid = instance_create(x, y, obj_treasureeffect);
	movespeed = 2;
	with (other)
	{
		sound_play_3d("event:/sfx/misc/secretfound", x, y);
		state = states.gottreasure;
		hsp = 0;
		vsp = 0;
	}
}
