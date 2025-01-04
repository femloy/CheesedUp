function create_afterimage(_x, _y, _sprite, _image_index)
{
	var q = 
	{
		x: _x,
		y: _y,
		sprite_index: _sprite,
		image_index: _image_index,
		image_angle: 0,
		alarm: [15, 6, -1],
		image_blend: choose(global.afterimage_color1, global.afterimage_color2),
		image_xscale: 1,
		image_yscale: 1,
		identifier: afterimage.simple,
		visible: true,
		alpha: 1
	};
	ds_list_add(global.afterimage_list, q);
	return q;
}
function create_mach3effect(_x, _y, _sprite, _image_index, _afterimage = false)
{
	if object_index == obj_player1 && _sprite == sprite_index
		_sprite = player_sprite();
	
	var color_ix = irandom(array_length(global.mach_colors) - 1);
	var q = 
	{
		x: _x,
		y: _y,
		sprite_index: _sprite,
		image_index: _image_index,
		image_angle: 0,
		alarm: [15, 6, -1],
		image_blend: global.mach_colors[color_ix],
		dark_blend: global.mach_colors_dark[color_ix],
		image_xscale: 1,
		image_yscale: 1,
		visible: true,
		identifier: afterimage.mach3effect,
		playerid: obj_player1,
		alpha: 1
	};
	if _afterimage
		q.identifier = afterimage.simple;
	ds_list_add(global.afterimage_list, q);
	return q;
}
function create_heatattack_afterimage(_x, _y, _sprite, _image_index, _xscale)
{
	var _velocity = 6;
	with (create_afterimage(_x, _y, _sprite, _image_index))
	{
		identifier = afterimage.heatattack;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = _xscale;
		hsp = _velocity;
		vsp = 0;
		image_blend = global.afterimage_color1;
	}
	with (create_afterimage(_x, _y, _sprite, _image_index))
	{
		identifier = afterimage.heatattack;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = _xscale;
		hsp = -_velocity;
		vsp = 0;
		image_blend = global.afterimage_color1;
	}
	with (create_afterimage(_x, _y, _sprite, _image_index))
	{
		identifier = afterimage.heatattack;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = _xscale;
		hsp = 0;
		vsp = _velocity;
		image_blend = global.afterimage_color1;
	}
	with (create_afterimage(_x, _y, _sprite, _image_index))
	{
		identifier = afterimage.heatattack;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = _xscale;
		hsp = 0;
		vsp = -_velocity;
		image_blend = global.afterimage_color1;
	}
}
function create_firemouth_afterimage(_x, _y, _sprite, _image_index, _xscale)
{
	var _yscale = 1;
	if object_index == obj_player1
	{
		if _sprite == sprite_index
			_sprite = player_sprite();
		_yscale = yscale;
	}	
	
	var b = create_afterimage(_x, _y, _sprite, _image_index);
	with (b)
	{
		fadeout = false;
		fadeoutstate = noone;
		identifier = afterimage.firemouth;
		alarm[0] = -1;
		alarm[1] = -1;
		alarm[2] = -1;
		image_xscale = _xscale;
		image_yscale = _yscale;
		image_blend = make_color_rgb(248, 112, 24);
		alpha = 0.8;
		basealpha = 1;
		playerid = noone;
		vertical = false;
		maxmovespeed = 10;
	}
	return b;
}
function create_blue_afterimage(_x, _y, _sprite, _image_index, _xscale)
{
	if global.afterimage == AFTERIMAGES.blue && (object_index == obj_player1 && character == "N")
		return create_noise_afterimage(_x, _y, _sprite, _image_index, _xscale);
	
	var _yscale = 1, _character = "P";
	if object_index == obj_player1
	{
		if _sprite == sprite_index
			_sprite = player_sprite();
		_xscale *= col_scale;
		_yscale = yscale * col_scale;
		_character = character;
	}
	
	if global.afterimage == AFTERIMAGES.blue or global.force_blue_afterimage
	{
		var b = create_afterimage(_x, _y, _sprite, _image_index);
		with b
		{
			fadeout = false;
			fadeoutstate = noone;
			identifier = afterimage.blue;
			alarm[0] = -1;
			alarm[1] = -1;
			alarm[2] = -1;
			image_xscale = _xscale;
			image_yscale = _yscale;
			image_blend = global.blueimg_color;
			dark_blend = global.blueimg_color_dark;
			alpha = 0.8;
			basealpha = 1;
			playerid = noone;
			vertical = false;
			maxmovespeed = 10;
		}
		return b;
	}
	else
	{
		var b = create_mach3effect(_x, _y, _sprite, _image_index, true);
		with b
		{
			image_xscale = _xscale;
			image_yscale = _yscale;
		}
		return b;
	}
}
function create_noise_afterimage(_x, _y, _sprite, _image_index, _xscale)
{
	var _yscale = 1;
	if object_index == obj_player1
	{
		if _sprite == sprite_index
			_sprite = player_sprite();
		_xscale *= col_scale;
		_yscale = yscale * col_scale;
	}
	
	var b = create_afterimage(_x, _y, _sprite, _image_index);
	with b
	{
		fadeout = false;
		fadeoutstate = -4;
		identifier = afterimage.noise;
		alarm[0] = -1;
		alarm[1] = -1;
		alarm[2] = -1;
		image_xscale = _xscale;
		image_yscale = _yscale;
		image_blend = c_white;
		alpha = 0.9;
		basealpha = 1;
		playerid = obj_player1;
		vertical = false;
		maxmovespeed = 10;
	}
	return b;
}
function create_red_afterimage(_x, _y, _sprite, _image_index, _xscale)
{
	var b = create_blue_afterimage(_x, _y, _sprite, _image_index, _xscale);
	with b
		identifier = afterimage.enemy;
	return b;
}
function create_blur_afterimage(_x, _y, _sprite, _image_index, _xscale)
{
	var _yscale = 1;
	if object_index == obj_player1
	{
		if _sprite == sprite_index
			_sprite = player_sprite();
		_xscale *= col_scale;
		_yscale = yscale * col_scale;
	}
	if object_index == obj_junkNEW
		_image_index = img;
	
	var b = create_afterimage(_x, _y, _sprite, _image_index);
	with b
	{
		fadeout = false;
		fadeoutstate = noone;
		identifier = afterimage.blur;
		alarm[0] = -1;
		alarm[1] = -1;
		alarm[2] = -1;
		image_blend = c_white;
		image_xscale = _xscale;
		image_yscale = _yscale;
		alpha = 0.8;
		playerid = noone;
		spd = 0.15;
		hsp = 0;
		vsp = 0;
	}
	return b;
}
