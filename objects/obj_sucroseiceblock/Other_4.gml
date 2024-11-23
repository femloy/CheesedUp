SS_CODE_START;

if type == "Fragile"
	stunfallspr = spr_sucroseice_fragile;
if type == "Heavy"
{
	stunfallspr = spr_sucroseice_heavy;
	grav2 = 0.7;
}

if (room == sucrose_6 || room == sucrose_6_1 || room == sucrose_7 || room == sucrose_8) 
{
	color_index = 1
	color = {
		light : #264d72,
		dark : #000000
	}
}

if content != noone
{
	contentspr = object_get_sprite(content);
	if contentspr == spr_pizzacollect1
		contentspr = scr_collectspr(obj_bigcollect, , false);
}
if in_saveroom()
	instance_destroy();

SS_CODE_END;
