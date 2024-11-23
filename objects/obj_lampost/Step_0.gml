sprite_index = REMIX ? spr_lampostpanic_NEW : spr_lampostpanic;
if global.panic
{
	if sprite_index == spr_lampostpanic_NEW
	{
		randomer += 1;
		if randomer % 4 == 0
			image_index = irandom_range(0, 1);
		if randomer >= 11
			randomer -= 11;
	}
	else
		image_speed = 0.2;
}
else
{
	image_speed = 0;
	image_index = 1;
}
