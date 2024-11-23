hsp = 1;
vsp = 0;

if global.laps >= 2
{
	if global.chasekind == chasekind.blocks
		instance_destroy();
	if global.chasekind == chasekind.slowdown
	{
		hsp = 0;
		vsp = 1;
	}
}
