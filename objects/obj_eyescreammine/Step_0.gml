SS_CODE_START;

var target = instance_nearest(x, y, obj_player);
if !target
	exit;

if place_meeting(x, y, target) && !active
{ 
	active = true;
	image_index = 0;
	sprite_index = spr_eyescreamsandwich_popout;
}
if sprite_index == spr_eyescreamsandwich_popout
{
	y = lerp(y, ystart - 25, 0.1);
	if image_index >= image_number - 1
	{
		tgt_x = target.x;
		tgt_y = target.y;
		sprite_index = spr_eyescreamsandwich_divestart;
		image_index = 0;
	}
}
if image_index >= image_number - 1 && sprite_index == spr_eyescreamsandwich_divestart
	sprite_index = spr_eyescreamsandwich_dive;

if sprite_index == spr_eyescreamsandwich_dive
{
	var dir = point_direction(x, y, tgt_x, tgt_y);
	x = Approach(x, tgt_x, lengthdir_x(16, dir));
	y = Approach(y, tgt_y, lengthdir_y(16, dir));
	
	if place_meeting(x, y, target) || (x == tgt_x && y == tgt_y)
	{
		instance_create(x, y, obj_canonexplosion);
		instance_destroy();
	}
}

SS_CODE_END;
