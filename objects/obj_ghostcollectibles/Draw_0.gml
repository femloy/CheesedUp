if !IT_ghost_collectibles()
	exit;

draw_set_color(c_white);
for (var i = 0; i < ds_list_size(collectiblelist); i++)
{
	var b = ds_list_find_value(collectiblelist, i);
	draw_sprite_ext(b.sprite_index, b.image_index, b.x, b.y, 1, 1, 0, c_white, b.image_alpha);
	
	if b.pizzasona
	{
		var chigaco = spr_chigaco;
		if SUGARY_SPIRE && check_sugary()
			chigaco = spr_movingplatform_ss;
		draw_sprite_ext(chigaco, b.image_index, b.x, b.y + (REMIX ? 46 : 49), 1, 1, 0, c_white, b.image_alpha);
	}
}
