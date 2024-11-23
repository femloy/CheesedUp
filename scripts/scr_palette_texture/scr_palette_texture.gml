/*
function scr_palette_textureOLD()
{
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	gpu_set_blendenable(false);
	gpu_set_colorwriteenable(false, false, false, true);
	draw_set_alpha(0);
	draw_rectangle(cx, cy, cx + 960, cy + 540, false);
	draw_set_alpha(1);
	draw_sprite_ext(sprite, index, _x, _y, _xscale, _yscale, _angle, blend, 1);
	gpu_set_blendenable(true);
	gpu_set_colorwriteenable(true, true, true, true);
	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
	gpu_set_alphatestenable(true);
	var xs = sprite_get_width(sprite) / sprite_get_width(global.palettetexture);
	var ys = sprite_get_height(sprite) / sprite_get_height(global.palettetexture);
	var xx = _x;
	var yy = _y;
	draw_sprite_ext(global.palettetexture, 0, xx, yy, xs, ys, 0, blend, alpha);
	gpu_set_alphatestenable(false);
	gpu_set_blendmode(bm_normal);
}
*/

function scr_get_texture_array()
{
	return [
		["funny", spr_peppattern1],
		["itchy", spr_peppattern2],
		["pizza", spr_peppattern3],
		["stripes", spr_peppattern4],
		["goldemanne", spr_peppattern5],
		["bones", spr_peppattern6],
		["pp", spr_peppattern7],
		["war", spr_peppattern8],
		["john", spr_peppattern9],
		["candy", spr_peppattern10],
		["bloodstained", spr_peppattern11],
		["bat", spr_peppattern12],
		["pumpkin", spr_peppattern13],
		["fur", spr_peppattern14],
		["flesh", spr_peppattern15],
		
		["racer", spr_noisepattern1],
		["comedian", spr_noisepattern2],
		["banana", spr_noisepattern3],
		["noiseTV", spr_noisepattern4],
		["madman", spr_noisepattern5],
		["bubbly", spr_noisepattern6],
		["welldone", spr_noisepattern7],
		["grannykisses", spr_noisepattern8],
		["towerguy", spr_noisepattern9]
	];
}

function scr_get_texture_palette(texture)
{
	var _arr = scr_get_texture_array();
	if texture != "none"
	{
		for (var i = 0; i < array_length(_arr); i++)
		{
			if (_arr[i][0] == texture)
				return _arr[i][1];
		}
		return SPRITES[? texture] ?? noone;
	}
	return noone;
}

function scr_get_texture_name(texture)
{
	var _arr = scr_get_texture_array();
	if (texture != noone)
	{
		for (var i = 0; i < array_length(_arr); i++)
		{
			if (_arr[i][1] == texture)
				return _arr[i][0];
		}
	}
	return "none";
}

/// @desc	Apply a palette texture (a pattern) to a given sprite and draw it
function scr_palette_texture(sprite, subimg, x, y, xscale, yscale, rot = 0, col = c_white, alpha = 1, gui = 0, texture = noone)
{
	if texture == noone
		texture = global.palettetexture;
	if texture == noone
		exit;
	
	if event_type == ev_draw && event_number == ev_gui
		gui = true;
	else
		gui = false;
	
	var surfw = sprite_get_width(sprite) * abs(xscale), surfh = sprite_get_height(sprite) * abs(yscale);
	if surfw == 0 or surfh == 0
		exit;
	
	//var palshader = shader_current();
	//reset_shader_fix();
	
	if (surface_get_width(global.palettesurface) != surfw || surface_get_height(global.palettesurface) != surfh)
		surface_free(global.palettesurface);
	if (surface_get_width(global.palettesurfaceclip) != surfw || surface_get_height(global.palettesurfaceclip) != surfh)
		surface_free(global.palettesurfaceclip);
	
	if (!surface_exists(global.palettesurface))
		global.palettesurface = surface_create(surfw, surfh);
	if (!surface_exists(global.palettesurfaceclip))
		global.palettesurfaceclip = surface_create(surfw, surfh);
	
	surface_set_target(global.palettesurfaceclip);
	draw_clear(c_white);
	gpu_set_blendmode(bm_subtract);
	
	var xo = sprite_get_xoffset(sprite);
	var yo = sprite_get_yoffset(sprite);
	
	draw_set_flash(c_white);
	draw_sprite_ext(sprite, subimg, xo * abs(xscale), yo * abs(yscale), xscale, yscale, rot, c_white, 1);
	draw_reset_flash();
	
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
	surface_set_target(global.palettesurface);
	draw_clear_alpha(c_black, 0);
	
	var sw = sprite_get_width(sprite);
	var sh = sprite_get_height(sprite);
	var xs = sw / sprite_get_width(texture);
	var ys = sh / sprite_get_height(texture);
	
	var xx = -xo;
	var yy = -yo;
	
	if xscale < 0
		xx = xo - sw;
	if yscale < 0
		yy = yo - sh;
	
	draw_sprite_ext(texture, global.Pattern_Index, 0, 0, (xs + 4) * abs(xscale), (ys + 4) * abs(yscale), 0, col, 1);
	gpu_set_blendmode(bm_subtract);
	draw_surface(global.palettesurfaceclip, 0, 0);
	
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
	draw_surface_ext(global.palettesurface, x - xo * abs(xscale), y - yo * abs(yscale), 1, 1, 0, c_white, alpha);
	
	//shader_set(palshader);
	//if gui
	//	reset_blendmode();
}
