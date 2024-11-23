if BO_NOISE && bo
{
	var _blend = make_colour_hsv(0, 0, 50), yoffset = 0;
	switch floor(image_index)
	{
	    case 18:
	    case 19:
	    case 26:
	    case 27:
	        var yoffset = 2;
	        break;
		
	    case 20:
	    case 25:
	        yoffset = -15;
	        break;
		
	    case 21:
	    case 22:
	    case 23:
	        yoffset = -40;
	        break;
		
	    case 24:
	        yoffset = -39;
	        break;
	}
	
	var spr = object_get_sprite(content);
	if spr == spr_toppinshroom
		spr = spr_toppinshroom_bo;
	if spr == spr_toppincheese
		spr = spr_toppincheese_bo;
	if spr == spr_toppintomato
		spr = spr_toppintomato_bo;
	
	draw_sprite_ext(spr, image_index, x + random_range(-1, 1), y - 25 + yoffset, image_xscale, image_yscale, image_angle, _blend, image_alpha);
}
draw_sprite(sprite_index, image_index, x, y);
if !(BO_NOISE && bo) && sprite_index != spr_pizzaboxunopen_old && sprite_index != spr_pizzaboxopen
{
	var help_spr = spr_toppinhelp;
	if SUGARY_SPIRE && sugary
		help_spr = spr_confecticage_help;
	draw_sprite_ext(help_spr, subimg, x, y - 70, (MOD.Mirror) ? -1 : 1, 1, 0, c_white, 1);
}
