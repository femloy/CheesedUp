SS_CODE_START;

with (other)
{
	if (state != states.cotton && state != states.tumble && state != states.door && state != states.cottonroll)
	{
		global.combofreeze = 30;
		state = states.cotton;
		if (movespeed > 6)
			movespeed = 6;
		create_particle(x, y, part.genericpoofeffect);
		//with (instance_create(x, y, obj_poofeffect))
			//color = 2;
		sprite_index = spr_cottonidle;
		//var myButton1 = get_control_string(global.key_jump) + get_control_string(global.key_jump);
		//var myButton2 = get_control_string(global.key_slap);
		//scr_controlprompt("[spr_buttonfont]" + myButton1 + "[spr_promptfont] Double Jump  [spr_buttonfont]" + myButton2 + "[spr_promptfont] Attack");
		create_transformation_tip(lstr("cottontip"), "cotton");
	}
}

SS_CODE_END;
