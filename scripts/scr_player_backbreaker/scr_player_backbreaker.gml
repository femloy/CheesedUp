function scr_player_backbreaker()
{
	mach2 = 0;
	if (sprite_index != spr_player_machfreefall)
	{
		hsp = 0;
		movespeed = 0;
	}
	else
		hsp = xscale * movespeed;
	move = key_right2 + key_left2;
	if (parrytimer > 0)
		parrytimer--;
	else
		instance_destroy(parry_inst);
	landAnim = false;
	if (sprite_index == spr_player_machfreefall && check_solid(x, y + 1))
	{
		state = states.machslide;
		sprite_index = spr_player_crouchslide;
	}
	if (sprite_index == spr_taunt or sprite_index == spr_supertaunt1 or sprite_index == spr_supertaunt2 or sprite_index == spr_supertaunt3 or sprite_index == spr_supertaunt4 or sprite_index == spr_player_supertaunt5 or sprite_index == spr_ratmount_taunt or sprite_index == spr_ratmount_supertaunt)
	{
		if (supercharged == 1 && (sprite_index == spr_supertaunt1 or sprite_index == spr_supertaunt2 or sprite_index == spr_supertaunt3 or sprite_index == spr_supertaunt4 or sprite_index == spr_player_supertaunt5 or sprite_index == spr_ratmount_supertaunt) && !instance_exists(obj_tauntaftereffectspawner))
		{
			if REMIX
				global.combotime = 60;
			instance_create(x, y, obj_tauntaftereffectspawner);
			scr_screenclear();
			supercharge = 0;
			supercharged = false;
		}
		if (input_taunt_p2 > 0 || (global.swapmode && swap_alone() && key_down2))
		{
			if (!swap_taunt && swap_player(false))
			{
				input_taunt_p2 = 0;
				if (taunttimer < 10)
					taunttimer = 10;
				swap_taunt = true;
				with (instance_create(0, 0, obj_swapmodeeffect))
					taunt = true;
				exit;
			}
		}
		taunttimer--;
		vsp = 0;
	}
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_supertaunt1 or sprite_index == spr_supertaunt2 or sprite_index == spr_supertaunt3 or sprite_index == spr_supertaunt4 or sprite_index == spr_player_supertaunt5 or sprite_index == spr_ratmount_supertaunt))
	{
		if (isgustavo)
			ratmount_movespeed = tauntstoredratmount_movespeed;
		movespeed = tauntstoredmovespeed;
		if character == "S"
			hsp = tauntstoredhsp;
		vsp = tauntstoredvsp;
		sprite_index = tauntstoredsprite;
		state = tauntstoredstate;
		supercharge = 0;
		supercharged = false;
		if (instance_exists(parry_inst))
		{
			instance_destroy(parry_inst);
			parry_inst = noone;
		}
		if (is_array(global.hasfarmer) && global.hasfarmer[farmerpos])
			scr_change_farmers();
	}
	if ((sprite_index == spr_taunt or sprite_index == spr_ratmount_taunt) && taunttimer == 0)
	{
		if (isgustavo)
			ratmount_movespeed = tauntstoredratmount_movespeed;
		movespeed = tauntstoredmovespeed;
		vsp = tauntstoredvsp;
		sprite_index = tauntstoredsprite;
		state = tauntstoredstate;
		if (instance_exists(parry_inst))
		{
			instance_destroy(parry_inst);
			parry_inst = noone;
		}
		if (is_array(global.hasfarmer) && global.hasfarmer[farmerpos])
			scr_change_farmers();
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_eatspaghetti)
		state = states.normal;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_throw)
		state = states.normal;
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_Timesup or sprite_index == spr_ratmountdoorclosed) && place_meeting(x, y, obj_exitgate))
		state = states.normal;
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_levelcomplete))
		state = states.normal;
	if (key_jump && sprite_index == spr_player_phoneidle)
	{
		global.panic = true;
		sprite_index = spr_bossintro;
		image_index = 0;
		with (instance_create(x, y, obj_debris))
		{
			image_index = 0;
			sprite_index = spr_phonedebris;
		}
	}
	if (global.miniboss == 1 && sprite_index == spr_bossintro && floor(image_index) == (image_number - 1))
		state = states.normal;
	image_speed = 0.4;
	if (supercharged && key_up)
		scr_dotaunt();
}
