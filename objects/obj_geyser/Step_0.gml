if geyser_timer > 0
	geyser_timer--;

// animation
geyser_image_index = (geyser_image_index + 0.35) % sprite_get_number(spr_geyservertical);
cloud_image_index = (cloud_image_index + 0.25) % sprite_get_number(spr_geysercloud);

// drain or fill
if !geyser_timer
{
	if geyser_size < 0
	{
		geyser_opacity = Approach(geyser_opacity, 0, 0.05);
		geyser_size = Approach(geyser_size, 0, 0.5);
	}
}
else if geyser_size > -vertical_stop_scale
{
	geyser_size = Approach(geyser_size, -vertical_stop_scale, 1);
	geyser_opacity = 1;
}

// player collision
var player = instance_place(x, y, obj_player);
if player
{	
	if geyser_timer > 0
	{
		// active
		if player.bbox_bottom > vertical_stop
		{
			with player
			{
				state = states.jump;
				sprite_index = spr_rockethitwall;
				jumpAnim = false;
				
				if character != "S"
					movespeed = 8;
				
				if vsp > -8
					vsp = -8;
				vsp = Approach(vsp, -18, 1);
			}
		}
	}
	else if player.bbox_bottom == y - 1 && (player.state == states.freefallland || player.state == states.ratmountbounce || player.state == states.ratmountgroundpound || player.sprite_index == player.spr_bodyslamland)
	{
		sound_play("event:/modded/sfx/geyser");
		geyser_timer = 300;
	}
}

// wafer blocks
with obj_waferdestroyable
{
	if place_meeting(x, y, other) && other.geyser_timer > 0 && bbox_bottom > other.y + other.geyser_size * 32
		event_user(0);
}
