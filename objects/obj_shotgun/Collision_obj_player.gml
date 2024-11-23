if !(!instance_exists(obj_backtohub_fadeout) && (!instance_exists(obj_pause) || obj_pause.alarm[5] == -1 || obj_pause.alarm[3] == -1))
	exit;

with other
{
	if state == states.handstandjump || state == states.lungeattack || state == states.punch
	or state == states.revolver
	{
		instance_destroy(obj_vigibullet);
		
		input_buffer_grab = 0;
		input_buffer_slap = 0;
		
		image_index = 0;
		sprite_index = spr_shotgunpullout;
		sound_play_3d("event:/sfx/pep/shotgunload", x, y);
		sound_play_3d("event:/sfx/misc/breakblock", x, y);
		instance_destroy(other);
		shotgunAnim = true;
		state = states.shotgun;
		
		var tip = lang_get_value("shotguntip");
		if global.shootbutton != 0 && character != "V"
			tip = string_replace(tip, "[G]", "[S]");
		create_transformation_tip(tip, "shotgun");
		
		if (room == war_1)
		{
			with (instance_create_unique(0, 0, obj_wartimer))
			{
				minutes = 0;
				seconds = 40;
			}
			with (obj_escapecollect)
				image_alpha = 1;
			with (obj_music)
				warstart = true;
		}
		global.heattime = 60;
	}
}
