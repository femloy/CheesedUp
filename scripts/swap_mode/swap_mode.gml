global.swap_damage[0] = 0;
global.swap_damage[1] = 0;
global.swap_characters = ["N", "P"];
global.swap_index = 0;
global.swapmode = false;

function swap_alone()
{
	return obj_inputAssigner.player_input_device[0] == obj_inputAssigner.player_input_device[1];
}
function swap_create()
{
	with obj_player1
	{
		instance_destroy(obj_swapmodefollow);
		
		var i = global.swap_index;
		repeat array_length(global.swap_characters)
		{
			if i != global.swap_index
			{
				with instance_create(x, y, obj_swapmodefollow)
				{
					swap_index = i;
					get_character_spr();
					sprite_index = spr_idle;
				}
			}

			i++;
			if i >= array_length(global.swap_characters)
				i = 0;
		}
	}
}
function swap_closest_follower()
{
	//if live_call() return live_result;
	
	var supposed = global.swap_index - 1;
	if supposed < 0
		supposed = array_length(global.swap_characters) - 1;
	
	with obj_swapmodefollow
	{
		if swap_index == supposed
			return id;
	}
	return noone;
}
function swap_player(hurted = false, jumpscare = false)
{
	if global.swapmode
	{
		if !jumpscare && (instance_exists(obj_noiseanimatroniceffect)/* || obj_swapmodefollow.animatronic > 0*/)
			return false;
		with obj_bosscontroller
		{
			if hurted && (player_hp - 1) <= 0
				return false;
		}
		if hurted && instance_exists(obj_bosscontroller) && global.swap_boss_damage + 1 < 3
			return false;
		if hurted
			global.swap_boss_damage = -1;
		
		state = states.normal;
		
		global.swap_index++;
		if global.swap_index >= array_length(global.swap_characters)
			global.swap_index = 0;
		character = global.swap_characters[global.swap_index];
		
		if character == "N"
		{
			if isgustavo
			{
				scr_switchpeppino();
				noisecrusher = true;
			}
			if global.noisejetpack
				noisepizzapepper = true;
			else if global.leveltosave == "freezer"
				global.noisejetpack = true;
			tauntstoredisgustavo = false;
		}
		else
		{
			if noisecrusher
			{
				noisecrusher = false;
				scr_switchgustavo(true, false);
			}
			if global.noisejetpack && !noisepizzapepper
				global.noisejetpack = false;
		}
		
		scr_characterspr();
		pistolcharge = 0;
		pistolchargeshooting = false;
		pistolanim = -4;
		
		global.pistol = false;
		if (character != "N" && (room == boss_vigilante || instance_exists(obj_pizzafaceboss_p2)))
		|| (instance_exists(obj_bosscontroller) && character == "N")
			global.pistol = true;
		
		if instance_exists(obj_randomsecret)
		{
			noisepizzapepper = false;
			if room == freezer_secret1
				global.noisejetpack = true;
			else if character == "N" && room == freezer_secret3
				global.noisejetpack = true;
		}
		with obj_bosscontroller
			refresh_sprites();
		with obj_gustavoswitch
		{
			x = xstart;
			y = ystart;
			create_particle(x, y, part.genericpoofeffect);
			var _esc = escape;
			event_perform(ev_create, 0);
			escape = _esc;
		}
		with obj_peppinoswitch
		{
			x = xstart;
			y = ystart;
			create_particle(x, y, part.genericpoofeffect);
			_esc = escape;
			event_perform(ev_create, 0);
			escape = _esc;
			event_perform(ev_other, ev_room_start);
		}
		with obj_playerbomb
		{
			dead = true;
			instance_destroy(id);
		}
		with obj_swapmodefollow
		{
			taunttimer = 0;
			
			swap_index++;
			if swap_index >= array_length(global.swap_characters)
				swap_index = 0;
			
			character = global.swap_characters[swap_index];
			if character != "N" && obj_player1.noisecrusher
				isgustavo = true;
			get_character_spr();
		}
		with obj_tv
		{
			if state != states.transition && !hurted
			{
				state = states.normal;
				if idleanim < 60
					idleanim = 60;
				sprite_index = other.character != "N" ? spr_tv_idle : spr_tv_idleN;
				if sprite_index == spr_tv_idle && other.isgustavo
					sprite_index = spr_tv_idleG;
			}
		}
		return true;
	}
	return false;
}
