image_speed = 0.35;
copy_player_scale(playerid);
x = playerid.x;
y = playerid.y;
if (global.combo < 25 && (!global.heatmeter or global.stylethreshold < 2)) or playerid.state != states.normal
	instance_destroy();
if (playerid.sprite_index == playerid.spr_catched)
	visible = false;
