if !instance_exists(player) or !player.burning
	instance_destroy();
else
{
	if player.burning == 1
		sprite_index = spr_fireoverlay;
	if player.burning == 2
		sprite_index = spr_wateroverlay;
	
	x = player.x;
	y = player.y;
}
