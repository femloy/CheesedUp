global.Pattern_Texture_Indexed = noone;

var secret_tile = 0;
if instance_exists(obj_cyop_tilelayer)
{
	with obj_cyop_tilelayer
	{
		if !secrettile
			continue;
		if (player && player.state != states.chainsaw) or active
			secret_tile = 1;
	}
}
else
{
	with obj_secrettile
	{
		if (player && player.state != states.chainsaw) or active
			secret_tile = 1;
	}
}
global.secrettile_clip_distance = lerp(global.secrettile_clip_distance, secret_tile * 150, 0.15);
