SS_CODE_START;

if collision_line(x, y, x, y + 32, obj_solid, false, false)
{
	while !check_solid(x, y + 1)
		y++;
	
	sprite_index = spr_juicepuddledone;
	grounded = true;
}
if in_saveroom()
	instance_destroy(id, false);

SS_CODE_END;
