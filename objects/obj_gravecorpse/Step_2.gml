image_index = playerid.image_index;
image_xscale = playerid.xscale;
image_yscale = playerid.yscale;
image_angle = playerid.angle;
x = playerid.x;
y = playerid.y;
visible = playerid.visible;
if (playerid.sprite_index == playerid.spr_playercorpsesurf)
	sprite_index = spr_corpsesurf;
if (playerid.sprite_index == playerid.spr_playercorpsestart)
	sprite_index = spr_corpsestart;
if (playerid.state != states.trashroll && playerid.state != states.chainsaw)
	instance_destroy();
