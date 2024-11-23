if in_baddieroom()
{
	instance_destroy();
	exit;
}

if global.in_cyop
	cyop_fix_object();

if escape
{
	if escapespawnID == noone
	{
		with (instance_create(x, y, obj_escapespawn))
		{
			baddieID = other.id;
			other.escapespawnID = id;
		}
		instance_deactivate_object(id);
	}
}
if elite && object_index != obj_robot
{
	hp += 1;
	elitehp = hp;
}
if check_heat() && ((elite && use_elite) or global.stylethreshold >= 3)
	paletteselect = elitepal;

// snap to ground if sugary
if SUGARY
{
	for(var i = 1; i < 32; i++)
	{
		if scr_solid(x, y + i)
		{
			y += i - 1;
			break;
		}
	}
}
