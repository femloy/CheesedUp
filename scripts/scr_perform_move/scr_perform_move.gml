#macro MAX_BULLETS 3
#macro MAX_FUEL 3

enum MOD_MOVE_TYPE
{
	grabattack,
	doublegrab,
	shootattack,
	uppercut
}

enum MOD_MOVES
{
	none,
	grab,
	kungfu,
	shoulderbash,
	lunge,
	faceplant,
	chainsaw,
	pistol,
	breakdance
}

function scr_player_handle_moves(required_state = state)
{
	if character == "MS" && scr_slapbuffercheck()
		scr_stick_doattack();
	
	if character != "V" && character != "S" && character != "MS"
	{
		if input_buffer_shoot > 0 && shotgunAnim
			scr_shotgunshoot();
		else if input_buffer_pistol > 0 && global.pistol
			scr_pistolshoot(required_state);
		else if key_shoot2
			scr_perform_move(MOD_MOVE_TYPE.shootattack, required_state);
		if scr_slapbuffercheck()
			scr_perform_move(MOD_MOVE_TYPE.grabattack, required_state);
	}
}

function scr_perform_move(move_type, required_state = state)
{
	if move_type == MOD_MOVE_TYPE.grabattack
	{
		if key_up && IT_allow_uppercut()
		{
			var pistol = (global.pistol && character != "N");
			if !((!shotgunAnim && !pistol) or global.shootbutton == SHOOT_BUTTONS.shoot or (global.shootbutton == SHOOT_BUTTONS.shoot_for_shotgun && !pistol))
				return;
			scr_resetslapbuffer();
			return scr_modmove_uppercut(required_state);
		}
		if sprite_index == spr_suplexbump
			return;
		if !((!shotgunAnim && !global.pistol) or global.shootbutton == SHOOT_BUTTONS.shoot or (global.shootbutton == SHOOT_BUTTONS.shoot_for_shotgun && !global.pistol))
			return;
	}
	
	var attackstyle = global.attackstyle;
	var doublegrab = global.doublegrab;
	var shootstyle = global.shootstyle;
	
	if input_buffer_grab > 0
		attackstyle = MOD_MOVES.grab;
	if attackstyle == doublegrab
		doublegrab = MOD_MOVES.grab;
	
	var move;
	switch move_type
	{
		default: return;
		case MOD_MOVE_TYPE.grabattack: move = attackstyle; break;
		case MOD_MOVE_TYPE.doublegrab: move = doublegrab; break;
		case MOD_MOVE_TYPE.shootattack: move = shootstyle; break;
	}
	
	switch move
	{
		case MOD_MOVES.grab: scr_modmove_grab(move_type, required_state); break;
		case MOD_MOVES.kungfu: scr_modmove_kungfu(move_type, required_state); break;
		case MOD_MOVES.shoulderbash: scr_modmove_shoulderbash(move_type, required_state); break;
		case MOD_MOVES.lunge: scr_modmove_lunge(move_type, required_state); break;
		case MOD_MOVES.faceplant: scr_modmove_faceplant(move_type, required_state); break;
		case MOD_MOVES.chainsaw: scr_modmove_chainsaw(move_type, required_state); break;
		case MOD_MOVES.pistol: scr_pistolshoot(required_state); break;
		case MOD_MOVES.breakdance: scr_modmove_breakdance(move_type, required_state); break;
	}
	scr_resetslapbuffer();
}
