#macro draw_sprite_base draw_sprite
#macro draw_sprite draw_sprite_hook

function draw_sprite_hook(sprite, subimg, x, y)
{
	if sprite_exists(sprite)
		draw_sprite_base(sprite, subimg, x, y);
	else if DEBUG
		trace("Non-existent sprite ", sprite);
}

#macro draw_sprite_ext_base draw_sprite_ext
#macro draw_sprite_ext draw_sprite_ext_hook

function draw_sprite_ext_hook(sprite, subimg, x, y, xscale, yscale, rot, col, alpha)
{
	if sprite_exists(sprite)
		draw_sprite_ext_base(sprite, subimg, x, y, xscale, yscale, rot, col, alpha);
	else if DEBUG
		trace("Non-existent sprite ", sprite);
}

#macro draw_sprite_tiled_base draw_sprite_tiled
#macro draw_sprite_tiled draw_sprite_tiled_hook

function draw_sprite_tiled_hook(sprite, subimg, x, y)
{
	if sprite_exists(sprite)
		draw_sprite_tiled_base(sprite, subimg, x, y);
	else if DEBUG
		trace("Non-existent sprite ", sprite);
}

#macro draw_sprite_part_base draw_sprite_part
#macro draw_sprite_part draw_sprite_part_hook

function draw_sprite_part_hook(sprite, subimg, left, top, width, height, x, y)
{
	if sprite_exists(sprite)
		draw_sprite_part_base(sprite, subimg, left, top, width, height, x, y);
	else if DEBUG
		trace("Non-existent sprite ", sprite);
}

#macro draw_sprite_part_ext_base draw_sprite_part_ext
#macro draw_sprite_part_ext draw_sprite_part_ext_hook

function draw_sprite_part_ext_hook(sprite, subimg, left, top, width, height, x, y, xscale, yscale, col, alpha)
{
	if sprite_exists(sprite)
		draw_sprite_part_ext_base(sprite, subimg, left, top, width, height, x, y, xscale, yscale, col, alpha);
	else if DEBUG
		trace("Non-existent sprite ", sprite);
}
