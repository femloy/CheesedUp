function scr_rankbubbledraw(rx, ry)
{
	if live_call(rx, ry) return live_result;
	
	if hud_is_hidden(true)
		exit;
	
	if SUGARY_SPIRE
		var sugary = check_sugarychar();
	if BO_NOISE
		var bo = (obj_player1.character == "BN");
	
	var _score = global.collect;
	var rank_ix = 0;
	
	if global.timeattack
	{
		if global.tatime <= global.tasrank
			rank_ix = scr_is_p_rank() ? 5 : 4;
		else if global.tatime <= global.taarank
			rank_ix = 3;
		else if global.tatime <= global.tabrank
			rank_ix = 2;
		else if global.tatime <= global.tacrank
			rank_ix = 1;
	}
	else
	{
		if _score >= global.srank && scr_is_p_rank()
			rank_ix = 5;
		else if _score >= global.srank
			rank_ix = 4;
		else if _score >= global.arank
			rank_ix = 3;
		else if _score >= global.brank
			rank_ix = 2;
		else if _score >= global.crank
			rank_ix = 1;
	}
	if rank_ix == 5 && REMIX && global.combotime < 15
	{
		// shake
		rx += random_range(-2, 2);
		ry += random_range(-2, 2);
	}
	
	if previousrank != rank_ix
	{
		var _snd = global.snd_rankup;
		if REMIX && rank_ix < previousrank
		{
			_snd = global.snd_rankdown;
			fmod_event_instance_set_parameter(_snd, "state", rank_ix, true);
		}
		else
			fmod_event_instance_set_parameter(_snd, "state", rank_ix - 1, true);
		fmod_event_instance_play(_snd);
		previousrank = rank_ix;
		rank_scale = 3;
	}
	rank_scale = Approach(rank_scale, 1, 0.2);
	
	var ranksprite = spr_ranks_hud;
	
	if global.timeattack
	{
		ranksprite = spr_ranks_hud_timed;
		if global.hud == hudstyles.minimal
			ranksprite = spr_ranks_timed_minimal;
	}
	else if global.hud == hudstyles.minimal
		ranksprite = spr_ranks_minimal;
	else if DEATH_MODE && MOD.DeathMode
		ranksprite = spr_ranks_death;
	else if SUGARY_SPIRE && sugary
		ranksprite = spr_ranks_hudSP;
	else if BO_NOISE && bo
		ranksprite = spr_ranks_hudBN;
	else if REMIX
		ranksprite = spr_ranks_hud_NEW;
	
	draw_sprite_ext(ranksprite, rank_ix, rx, ry, rank_scale, rank_scale, 0, c_white, 1);
	
	var spr_w = sprite_get_width(ranksprite);
	var spr_h = sprite_get_height(ranksprite);
	var spr_xo = sprite_get_xoffset(ranksprite);
	var spr_yo = sprite_get_yoffset(ranksprite);
	
	if !global.snickchallenge && !global.timeattack
	{
		var perc = 0;
		switch rank_ix
		{
			case 4:
			case 5:
				perc = 0;
				break;
			case 3:
				perc = (_score - global.arank) / (global.srank - global.arank);
				break;
			case 2:
				perc = (_score - global.brank) / (global.arank - global.brank);
				break;
			case 1:
				perc = (_score - global.crank) / (global.brank - global.crank);
				break;
			default:
				perc = _score / global.crank;
		}
	
		var t = spr_h * perc;
		var top = spr_h - t;
		
		var rankfillsprite = spr_ranks_hudfill;
		if global.hud == hudstyles.minimal
		{
			rankfillsprite = spr_ranks_minimal;
			rank_ix++;
		}
		else if DEATH_MODE && MOD.DeathMode
			rankfillsprite = spr_ranks_deathfill;
		else if SUGARY_SPIRE && sugary
			rankfillsprite = spr_ranks_hudfillSP;
		else if BO_NOISE && bo
			rankfillsprite = spr_ranks_hudfillBN;
		else if REMIX
			rankfillsprite = spr_ranks_hudfill_NEW;
		
		if rank_scale == 1 or !REMIX
			draw_sprite_part(rankfillsprite, rank_ix, 0, top, spr_w, spr_h - top, rx - spr_xo, (ry - spr_yo) + top);
	}
	else if rank_scale == 1
	{
		var perc = 0;
		if global.timeattack
		{
			switch rank_ix
			{
				case 5:
				case 4:
					perc = global.tatime / global.tasrank;
					break;
				case 3:
					perc = (global.tatime - global.tasrank) / (global.taarank - global.tasrank);
					break;
				case 2:
					perc = (global.tatime - global.taarank) / (global.tabrank - global.taarank);
					break;
				case 1:
					perc = (global.tatime - global.tabrank) / (global.tacrank - global.tabrank);
					break;
			}
		}
		else
		{
			switch rank_ix
			{
				case 5:
				case 4:
					perc = (10000 - _score) / (10000 - global.srank);
					break;
				case 3:
					perc = (global.srank - _score) / (global.srank - global.arank);
					break;
				case 2:
					perc = (global.arank - _score) / (global.arank - global.brank);
					break;
				case 1:
					perc = (global.brank - _score) / (global.brank - global.crank);
					break;
			}
		}
		
		var rankfillsprite = spr_ranks_hudrev;
		if global.timeattack
		{
			rankfillsprite = spr_ranks_hud_timedfill;
			if global.hud == hudstyles.minimal
				rankfillsprite = spr_ranks_timed_minimalfill;
		}
		else if global.hud == hudstyles.minimal
		{
			rankfillsprite = spr_ranks_minimal;
			if rank_ix == 5
				rank_ix--;
			rank_ix--;
		}
		else if SUGARY_SPIRE && sugary
			rankfillsprite = spr_ranks_hudrevSP;
		else if BO_NOISE && bo
			rankfillsprite = spr_ranks_hudrevBN;
		else if REMIX
			rankfillsprite = spr_ranks_hudrev_NEW;
		
		var t = spr_h * perc;
		draw_sprite_part(rankfillsprite, rank_ix, 0, 0, spr_w, t, rx - spr_xo, ry - spr_yo);
	}
}
