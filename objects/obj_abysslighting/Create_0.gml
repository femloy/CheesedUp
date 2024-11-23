live_auto_call;

depth = -1000;
surf = noone;

radius = instance_exists(obj_deliverytimer) ? 1 : 0;
spotlights = [
	[obj_player, 250, [0, 0]],
	[obj_exitgate, 300, [0, 20]],
	[obj_hungrypillar, 300, [0, 20]],
	[obj_lightsource, 200, [0, 0]],
];
darkners = [
	obj_taunteffect,
	obj_brickcomeback,
	obj_brickball,
	obj_followcharacter,
	obj_player,
]

draw_hole = function(x, y, radius, pre)
{
	if pre
	{
		draw_set_colour(c_black);
		draw_circle(x - CAMX, y - CAMY, radius + 1, false);
	}
	else
	{
		gpu_set_blendmode(bm_subtract);
		draw_circle(x - CAMX, y - CAMY, radius, false);
		gpu_set_blendmode(bm_normal);
	}
}

black = shader_get_uniform(shd_rank, "black");
brown = shader_get_uniform(shd_rank, "brown");
