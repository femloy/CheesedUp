function slope_direction(_id = noone) 
{
	var slope = _id;
	
	if slope == noone
		slope = check_slope(x, y + 1, true);
	
	if slope == noone
		return 0;
	
	return sign(slope.image_xscale);
}
