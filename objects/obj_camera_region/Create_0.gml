depth = -10;
func = function()
{
	return place_meeting(x, y, obj_player);
}

if global.in_afom
{
	sprite_index = spr_car_solid;
	zoom = 1;
	image_angle = 0;
}
