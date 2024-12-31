function scr_preventbump(intended_state = state)
{
	if !scr_modding_hook_falser("block/preventbump")
		return false;
	
	switch intended_state
	{
		default:
			return !place_meeting(x + hsp, y, obj_destructibles);
		
		case states.mach3:
			return !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock);
		
		case states.firemouth:
			return !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_tntblock) && !place_meeting(x + hsp, y, obj_iceblock) && !place_meeting(x + hsp, y, obj_ratblock);
		
		case states.fightball:
			return !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock);
		
		case states.punch: case states.pistol: case states.jetpackjump:
			return !place_meeting(x + xscale, y, obj_destructibles);
		
		case states.trickjump: case states.slipnslide: case states.machroll: case states.knightpepslopes:
		case states.grab:
			return !place_meeting(x + sign(hsp), y, obj_destructibles);
		
		case states.trashroll:
			return !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_rattumble);
		
		case states.rocket:
			return !place_meeting(x + sign(hsp), y, obj_metalblock) && (!place_meeting(x + sign(hsp), y, obj_ratblock) || place_meeting(x + sign(hsp), y, obj_rattumble)) && !place_meeting(x + sign(hsp), y, obj_destructibles);
		
		case states.rideweenie:
			return !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_ratblock);
		
		case states.tumble:
			return !place_meeting(x + hsp, y, obj_rollblock) && !place_meeting(x + hsp, y, obj_unbumpablewall)
			&& (!place_meeting(x + hsp, y, obj_rattumble) || sprite_index != spr_tumble) && !place_meeting(x + hsp, y, obj_destructibles)
			&& ((!place_meeting(x + hsp, y, obj_ratblock1x1) && (!place_meeting(x + hsp, y, obj_rattumble) or place_meeting(x + hsp, y, obj_rattumble_big))) or character != "V");
	}
}
