var flag = false;
if in_baddieroom()
{
	state = states.finishingblow;
	flag = true;
}
else if in_saveroom()
{
	state = states.dead;
	flag = true;
}
if flag
{
	with obj_raceend
	{
		other.x = x + (sprite_width / 2);
		other.y = (y + sprite_height) - 32;
	}
}

if global.timeattack
	instance_destroy();
