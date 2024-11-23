var _x = x - 23;
var _y = y + 66;
if (!vengeful)
{
	draw_sprite(spr_noisette1, image_index, x, y);
	if !check_char("V")
		draw_sprite(spr_vigilantenoisette1, image_index, _x, _y);
}
else
{
	draw_sprite(spr_noisette2, image_index, x, y);
	if !check_char("V")
		draw_sprite(spr_vigilantenoisette2, image_index, _x, _y);
}
