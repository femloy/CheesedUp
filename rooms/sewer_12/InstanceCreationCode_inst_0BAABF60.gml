hsp = 1;
vsp = 0;

if global.laps >= 2
{
	if global.chasekind == CHASE_KINDS.blocks
		instance_destroy();
	if global.chasekind == CHASE_KINDS.slowdown
	{
		hsp = 0;
		vsp = 1;
	}
}
