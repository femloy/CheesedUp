live_auto_call;

if !instance_exists(obj_mainmenu)
{
	draw_self();
	exit;
}

var sandbox = obj_mainmenu.charselect == 0;
var game = scr_get_game(slot - 1, sandbox);

var tvpal = 0;
if obj_mainmenu.charselect != -1
{
	switch game.character
	{
		case "N": tvpal = 1; break;
		case "V": tvpal = 2; break;
	}
}

if sandbox
{
	draw_self();
	
	if !surface_exists(surface) or surface_rebuild
	{
		if surface_exists(surface)
			surface_free(surface);
		surface_rebuild = false;
		
		surface = surface_create(sprite_get_width(clipspr), sprite_get_height(clipspr));
		surface_set_target(surface);
		draw_clear_alpha(0, 0);
		
		pal_swap_set(spr_menutv_palette, 3, false);
		draw_sprite(sprite_index, image_index, sprite_get_xoffset(sprite_index), sprite_get_yoffset(sprite_index));
		pal_swap_reset();
		
		surface_reset_target();
	}
	
	var xx = x - sprite_get_xoffset(sprite_index), yy = y - sprite_get_yoffset(sprite_index);
	var tvx = xx + round(random_range(-1, 1)), tvy = yy + round(random_range(-1, 1));
	
	if sprite_index == selectedspr
	{
		draw_set_mask(tvx, tvy, clipspr, 1);
		draw_rectangle_color(xx, yy, xx + sprite_get_width(clipspr), yy + sprite_get_height(clipspr), #d07808, #d07808, #d07808, #d07808, false);
		
		var timer = floor(current_time / 35) * 35;
		draw_sprite_ext(CHEESED_UP ? spr_cheese : spr_sandboxtvs, noisehead, xx + noisexoffset + random_range(-1, 1), yy + noiseyoffset + random_range(-1, 1), noisescale + sin(timer / 50) * .5, noisescale + sin(timer / 60 + pi) * .5, sin(timer / 200 + pi / 2) * 25, c_white, 1);
	}
	if sprite_index == confirmspr
	{
		draw_set_mask(tvx, tvy, clipspr, 1);
		var time = (250 - obj_mainmenu.alarm[0]) / 250;
		var c = merge_color(#d07808, c_red, time);
		draw_rectangle_color(xx, yy, xx + sprite_get_width(clipspr), yy + sprite_get_height(clipspr), c, c, c, c, false);
		var scale = noisescale + abs(sin(current_time / 200) * time) * 2;
		draw_sprite_ext(CHEESED_UP ? spr_cheese : spr_sandboxtvs, noisehead, xx + noisexoffset + random_range(-1, 1), yy + noiseyoffset + random_range(-1, 1), scale, scale, 0, c_white, 1);
	}
	draw_set_mask(tvx, tvy, clipspr);
	draw_surface_ext(surface, tvx, tvy, 1, 1, 0, make_color_hsv(((current_time - x) / 20) % 255, 200, 255), 1);
	draw_reset_clip();
}
else if game.character == "N" && (sprite_index == selectedspr or sprite_index == confirmspr)
{
	var spr = SPRITES[? concat(sprite_get_name(sprite_index), "N")] ?? sprite_index;
	shader_set(global.Pal_Shader);
	
	var pal = game.palette;
	var tex = game.palettetexture;
	pattern_set(scr_color_array("N"), spr, image_index, image_xscale, image_yscale, tex);
	pal_swap_set(spr_noisepalette, pal, false);
	draw_sprite(spr, image_index, x, y);
	pattern_reset();
	shader_reset();
}
else
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_menutv_palette, tvpal, false);
	draw_self();
	shader_reset();
}
