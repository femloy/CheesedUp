if (use_static)
	draw_sprite_stretched(spr_tvstatic, static_index, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
else
{
	var bg = spr_technicaldifficulty_bg;
	switch chara
	{
		default:
			screen_clear(#D868A0);
			break;
		case "N":
			screen_clear(#D88818);
			bg = spr_technicaldifficulty_bgnoise;
			break;
		case "V":
			screen_clear(#982800);
			bg = spr_technicaldifficulty_bgV;
			break;
	}
	
	var cx = SCREEN_X, cy = SCREEN_Y;
	draw_sprite(bg, 0, cx, cy);
	
	lang_draw_sprite(spr_technicaldifficulty_text, 0, cx, cy);
	
	pal_swap_player_palette(sprite, 0, 1, 1, , sprite == spr_technicaldifficulty4);
	pal_swap_supernoise();
	if topleft
		draw_sprite(sprite, 0, cx, cy);
	else
		draw_sprite(sprite, 0, cx + 300, cy + 352);
	pal_swap_reset();
}
