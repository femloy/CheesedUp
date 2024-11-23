if (follow == 1)
{
	x = obj_player1.x;
	y = obj_player1.y;
}
visible = !(instance_exists(obj_drawcontroller) && obj_drawcontroller.use_dark) or sprite_index != spr_deadjohnsmoke;
