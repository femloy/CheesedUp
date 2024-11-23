if (sprite_index == spr_pumpkingate2)
{
	if pumpkins != 20
	{
		draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		
	    draw_set_font(global.creditsfont);
	    draw_set_color(c_white);
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_top);
	    draw_text_new(x + 51, y + 45, string(pumpkins));
	}
	else
		draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
	draw_self();
