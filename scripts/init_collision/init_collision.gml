global.world_gravity = 1;
function init_collision()
{
	hsp = 0;
	vsp = 0;
	hsp_carry = 0;
	vsp_carry = 0;
	grav = 0.5;
	platformid = noone;
	grounded = false;
	
	flip = 1; // -1 for flip
	col_scale = 1;
}
