live_auto_call;

if keyboard_check_pressed(ord("R"))
{
	instance_destroy();
	instance_create(x, y, object_index);
}

// fade
if fadein
{
	fade = Approach(fade, 1, 0.1);
	if fade >= 1
		fadein = false;
}
else
{
	fade = Approach(fade, 0, 0.1);
	if fade <= 0 && state == 1
		instance_destroy();
}

if (state == 0 && !fadein) or (state == 1 && fadein)
{
	// input
	scr_menu_getinput();
	if (key_slap2 or key_quit2)
	{
		state = 1;
		fadein = true;
	}
	
	var move_ver = key_down2 - key_up2;
	if move_ver != 0
	{
		sel_category = wrap(sel_category + move_ver, 0, 2);
		sound_play(sfx_angelmove);
	}
	
	var move_hor = key_right2 + key_left2;
	if move_hor != 0
	{
		var len = 0;
		switch sel_category
		{
			case 0: len = array_length(hats) - 1; break;
			case 1: len = array_length(pets) - 1; break;
			case 2: len = array_length(clothes) - 1; break;
		}
		sel = wrap(sel + move_hor, 0, len);
		sound_play(sfx_angelmove);
	}
	
	// item
	switch sel_category
	{
		case 0:
			var this = hats[sel];
			item_sprite = this.sprite;
			item_spr_palette = noone;
			item_name = this.name;
			item_offset = this.offset;
			dialog = this.desc;
			break;
	}
	item_image += 0.35;
	
	// sign
	switch sign_state
	{
		case 0:
			sign_y += sign_vsp;
			if sign_vsp < 20
				sign_vsp += 0.5;
			if sign_y > 0
				sign_state = 1;
			break;
		
		case 1:
			sign_y = Approach(sign_y, 0, 2);
			break;
	}

	// dialog
	switch dialog_state
	{
		case 0:
			if dialog != "" && fade == 0
			{
				dialog_state = 1;
				dialog_image = 0;
				dialog_previous = dialog;
				dialog_formatted = format_dialog(dialog);
				dialog_pos = 0;
				break;
			}
		
		case 1:
			dialog_image += 0.35;
			if dialog_image >= sprite_get_number(spr_shop_bubbleopen)
				dialog_state = 2;
			break;
		
		case 3:
			dialog_image += 0.35;
			if dialog_image >= sprite_get_number(spr_shop_bubbleopen) - 1
			{
				dialog_image = 0;
				dialog_state = 1;
			}
			break;
		
		case 2:
			if dialog != dialog_previous
			{
				dialog_state = 3;
				dialog_image = 0;
				dialog_pos = 0;
				dialog_previous = dialog;
				dialog_formatted = format_dialog(dialog);
				dialog_delay = 0;
				break;
			}
			
			var strlen = string_length(dialog);
			if dialog_pos < strlen && dialog_delay-- <= 0
			{
				dialog_delay = 1;
				
				sound_play("event:/modded/mariotalk");
				dialog_pos++;
				
				var char = string_char_at(dialog, dialog_pos), char2 = string_char_at(dialog, dialog_pos + 1);
				var stop_char = [".", ",", "!", "?"];
				if array_contains(stop_char, char, 0, infinity) && !array_contains(stop_char, char2, 0, infinity)
					dialog_delay = char == "," ? 8 : 16;
			}
			break;
	}
}
