if character == "V"
	exit;
if (!other.grabbable)
	exit;

if (state != states.boxxedpepspin)
{
	if (state == states.handstandjump || state == states.lungeattack || (state == states.punch && !REMIX) or check_kungfu_state() or sprite_index == spr_breakdanceuppercut)
	{
		if (other.state == states.normal && scr_transformationcheck() && !cutscene && state != states.bombgrab && (state == states.handstandjump || state == states.punch || state == states.lungeattack))
		{
			state = states.bombgrab;
			image_index = 0;
			sprite_index = spr_haulingstart;
			other.defused = true;
			bombgrabID = other.id;
			if (character == "N")
				create_transformation_tip(lang_get_value("bombtipN"), "bombtipN");
			sound_play_3d("event:/sfx/noise/bombbounce", x, y);
			with (instance_create(x + (xscale * 25), y, obj_parryeffect))
			{
				sprite_index = spr_grabeffect;
				image_xscale = other.xscale;
				image_speed = 0.35;
			}
			with (other)
			{
				state = states.grabbed;
				playerid = other.id;
			}
		}
	}
}
else if (other.kickbuffer <= 0)
{
	other.vsp = -9;
	other.movespeed = 7;
	other.image_xscale = xscale;
	other.kickbuffer = 15;
	other.y--;
	other.defused = true;
}
