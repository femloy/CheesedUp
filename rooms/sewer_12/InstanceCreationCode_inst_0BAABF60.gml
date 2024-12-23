hsp = 1;
vsp = 0;

if global.laps >= 2
{
	if global.chasekind == chasekinds.blocks
		instance_destroy();
	if global.chasekind == chasekinds.slowdown
	{
		hsp = 0;
		vsp = 1;
	}
}
