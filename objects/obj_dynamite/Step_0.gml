hsp = image_xscale * movespeed;
mask_index = spr_player_mask;

with obj_ratblock
{
	if object_index != obj_ratblock && collision_rectangle(bbox_left - 32 - other.hsp, bbox_top - 32, bbox_right + 32 - other.hsp, bbox_bottom, other, false, false)
	{
		event_perform(ev_alarm, 0);
		with other
		{
			instance_destroy();
			instance_create(x, y, obj_explosion);
		}
		exit;
	}
}

if (place_meeting(x + hsp, y + vsp, obj_destructibles) || place_meeting(x + hsp, y + vsp, obj_ratblock)
|| place_meeting(x + hsp, y + vsp, obj_tntblock) || place_meeting(x + hsp, y + vsp, obj_metalblock)
|| (obj_explosion != obj_canonexplosion && place_meeting(x, y, obj_baddie)))
	event_user(0);

if (scr_solid(x, y + 1) && vsp > 0)
{
	vsp = -5;
	if (movespeed > 0)
		movespeed -= 1;
}

if (obj_explosion != obj_dynamiteexplosion_boss && obj_explosion != obj_canonexplosion
&& (playerid.key_chainsaw2 or playerid.key_shoot2) && (playerid.state != states.dynamite or cooldown-- <= 0))
	event_user(0);

if (check_solid(x + hsp, y) || (obj_explosion != obj_canonexplosion && place_meeting(x, y, obj_baddie)))
	image_xscale *= -1;

if (countdown <= 0)
	event_user(0);

if (sprite_index == spr_dynamite && countdown < 60)
	sprite_index = spr_dynamiteabouttoexplode;
if (sprite_index == spr_dynamite || sprite_index == spr_dynamiteabouttoexplode)
	countdown--;

scr_collide();

if !bbox_in_camera(view_camera[0], 100)
	event_user(0);