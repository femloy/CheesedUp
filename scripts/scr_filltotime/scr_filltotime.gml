function scr_filltotime(fill = global.fill)
{
	var seconds = ceil(global.fill / 12);
	var minutes = floor(seconds / 60);
	seconds = seconds % 60;
	
	return [minutes, seconds];
}
