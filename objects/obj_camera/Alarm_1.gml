if DEATH_MODE
{
	if MOD.DeathMode
		exit;
}

if (global.panic or global.snickchallenge) && !instance_exists(obj_ghostcollectibles)
{
	global.seconds -= 1;
	if global.collect >= 5 && !instance_exists(obj_ghostcollectibles)
	{
		global.collect -= 5;
		with instance_create(121, 60, obj_negativenumber)
			number = "-5";
	}
	if (global.seconds < 0)
	{
		global.seconds = 59;
		global.minutes -= 1;
	}
}
if global.timedgate || global.miniboss
{
	global.seconds -= 1;
	if global.seconds < 0
	{
		global.seconds = 59;
		global.minutes -= 1;
	}
}
if global.minutes < 0
{
	global.seconds = 0;
	global.minutes = 0;
}
alarm[1] = 60;
