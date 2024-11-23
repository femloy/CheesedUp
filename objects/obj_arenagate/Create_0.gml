image_speed = 0.5;
sprite_index = spr_arenagate_opened;
block_inst = noone;

close = function()
{
	sprite_index = spr_arenagate_close;
	image_index = 0;
	
	block_inst = instance_create(x, y, obj_solid);
	with (block_inst)
	{
		sprite_index = spr_arenagate_open;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
}
open = function()
{
	image_index = 0;
	sprite_index = spr_arenagate_open;
	instance_destroy(block_inst);
}
