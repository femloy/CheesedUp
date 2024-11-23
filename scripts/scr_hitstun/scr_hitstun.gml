global.hitstun_multiplier = 1;
function scr_hitstun_player(lag, stored_sprite = sprite_index, stored_state = state)
{
	if state != states.chainsaw
	{
		tauntstoredmovespeed = movespeed;
		tauntstoredsprite = stored_sprite;
		tauntstoredstate = stored_state;
		tauntstoredhsp = hsp;
		tauntstoredvsp = vsp;
	}
	
	hitLag = lag * global.hitstun_multiplier;
	hitX = x;
	hitY = y;
	
	state = states.chainsaw;
	
	if global.hitstun != 1
	{
		hitLag = 0;
		scr_player_chainsaw();
	}
}
function scr_hitstun_enemy(baddieID, lag, stored_hsp = hsp, stored_vsp = vsp)
{
	with baddieID
	{
		if state != states.hit
		{
			hitX = x;
			hitY = y;
		}
		
		hitLag = lag * global.hitstun_multiplier;
		alarm[3] = 3;
		state = states.hit;
		
		hithsp = stored_hsp;
		hitvsp = stored_vsp;
		
		if global.hitstun != 1
		{
			alarm[3] = -1;
			hitLag = 0;
			//event_perform(ev_step, ev_step_normal);
		}
	}
}
