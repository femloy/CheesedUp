function get_curve_scale()
{
	return max((SCREEN_WIDTH / 960), (SCREEN_HEIGHT / 540));
}
function get_screen_xscale()
{
	return (SCREEN_WIDTH / 960);
}
function get_screen_yscale()
{
	return (SCREEN_WIDTH / 960);
}
function screen_center_x(input)
{
	return round((SCREEN_WIDTH / 2) + (input - (960 / 2)));
}
function screen_center_y(input)
{
	return round((SCREEN_HEIGHT / 2) + (input - (540 / 2)));
}
