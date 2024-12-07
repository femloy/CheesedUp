function scr_draw_rank()
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	
	var spr = asset_get_index(sprite_get_name(sprite_index) + "_text");
    if spr < 0
        exit;
    
    var number = sprite_get_number(spr);
    var image = (image_index - image_number) + (number - 1);
    
	if image >= 0
		lang_draw_sprite_ext(spr, image, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
