SS_CODE_START;

if !start
{
	if fadein == 0
		fadealpha += 0.1;
	
	if fadealpha > 1
	{
		fadealpha = 0;
		start = true;
			
		title_music = fmod_event_create_instance(info.song);
		if global.jukebox == noone
		{
			var _s = 0;
			switch obj_player1.character
			{
				case "N": _s = 1; break;
				case "V": _s = 2; break;
			}
			
			fmod_event_instance_set_parameter(title_music, "state", _s, true);
			fmod_event_instance_play(title_music);
		}
		
		switch info.bginfo[1]
		{
			case cardtype.up:
				bgY = -sprite_get_height(info.bginfo[0])
				bgX = 0
				break;
			case cardtype.down:
				bgY = sprite_get_height(info.bginfo[0])
				bgX = 0
				break;
			case cardtype.left:
				bgY = 0
				bgX = -sprite_get_width(info.bginfo[0])
				break;
			case cardtype.right:
				bgY = 0
				bgX = sprite_get_width(info.bginfo[0])
				break;
		}
		
		switch info.titleinfo[1]
		{
			case cardtype.up:
				titleY = -750
				titleX = 0
				break;
			case cardtype.down:
				titleY = 750
				titleX = 0
				break;
			case cardtype.left:
				titleY = 0
				titleX = -1280
				break;
			case cardtype.right:
				titleY = 0
				titleX = 1280
				break;
		}
	}
}
else
{	
	if info.bginfo[2] == cardtype.interp
	{
		bgX = lerp(bgX, info.bginfo[4], 0.1) + (info.bginfo[3] = cardtype.shake ? irandom_range(-2, 2) : 0)
		bgY = lerp(bgY, info.bginfo[5], 0.1) + (info.bginfo[3] = cardtype.waving ? Wave(2, -2, 5, 0) : 0) + (info.bginfo[3] = cardtype.shake ? irandom_range(-2, 2) : 0)
	}
	else
	{
		bgX = Approach(bgX, info.bginfo[4], 40) + (info.bginfo[3] = cardtype.shake ? irandom_range(-2, 2) : 0)
		bgY = Approach(bgY, info.bginfo[5], 40) + (info.bginfo[3] = cardtype.waving ? Wave(2, -2, 5, 0) : 0) + (info.bginfo[3] = cardtype.shake ? irandom_range(-2, 2) : 0)
	}
	
	step += 0.025;
	if round(step) > 0
	{
		if info.titleinfo[2] == cardtype.interp
		{
			titleX = lerp(titleX, info.titleinfo[4], 0.1) + (info.titleinfo[3] = cardtype.shake ? irandom_range(-2, 2) : 0);
			titleY = lerp(titleY, info.titleinfo[5], 0.1) + (info.titleinfo[3] = cardtype.waving ? Wave(2, -2, 5, 0) : 0) + (info.titleinfo[3] = cardtype.shake ? irandom_range(-2, 2) : 0);
		}
		else
		{
			titleX = Approach(titleX, info.titleinfo[4], 40) + (info.titleinfo[3] = cardtype.shake ? irandom_range(-2, 2) : 0);
			titleY = Approach(titleY, info.titleinfo[5], 40) + (info.titleinfo[3] = cardtype.waving ? Wave(2, -2, 5, 0) : 0) + (info.titleinfo[3] = cardtype.shake ? irandom_range(-2, 2) : 0);
		}		
	}
	
	if !fmod_event_instance_is_playing(title_music) && round(step) > 3 && !loading
	{
		fmod_event_instance_release(title_music);
		
		loading = true;
		with instance_create(x, y, obj_fadeout)
			restarttimer = true;
		if group_arr != noone
		{
			with instance_create(x, y, obj_loadingscreen)
			{
				offload_arr = other.offload_arr;
				group_arr = other.group_arr;
			}
		}
	}
}

SS_CODE_END;
