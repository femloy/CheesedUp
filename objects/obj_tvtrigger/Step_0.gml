live_auto_call;

if cyop
{
	// auto text
	if string_pos("BEEBAWP", global.cyop_tower_name) != 0
	{
		text = string_replace_all(text, "Peppino", scr_charactername(obj_player1.character, obj_player1.isgustavo));
		text = string_replace_all(text, "PEPPINO", string_upper(scr_charactername(obj_player1.character, obj_player1.isgustavo)));
	
		if obj_player1.character == "N" && (place_meeting(x, y, obj_deliverypizzabox) or place_meeting(x, y, obj_gustavoswitch))
		{
			instance_destroy();
			exit;
		}
	
		// uppercase
		var pizzaman = "Pizzaman";
		switch obj_player1.character
		{
			case "V": pizzaman = "Cowboy"; break;
			case "S": pizzaman = "Porcupine"; break;
			case "G": pizzaman = "Pizzamen"; break;
			case "M": pizzaman = "Artist"; break;
		}
		text = string_replace_all(text, "Pizzaman", pizzaman);
	
		// lowecase
		var pizzaman = "pizzaman";
		switch obj_player1.character
		{
			case "V": pizzaman = "cowboy"; break;
			case "S": pizzaman = "porcupine"; break;
			case "G": pizzaman = "pizzamen"; break;
			case "M": pizzaman = "artist"; break;
		}
		text = string_replace_all(text, "pizzaman", pizzaman);
	
		// I LOVE PRONOUNS
		if obj_player1.character == "G"
		{
			//text = string_replace_all(text, " has ", " have ");
			text = string_replace_all(text, " himself", " themselves");
			text = string_replace_all(text, " his ", " their ");
			text = string_replace_all(text, " his", " theirs");
			text = string_replace_all(text, " him ", " them ");
			text = string_replace_all(text, " he ", " they ");
			text = string_replace_all(text, " he's ", " they're ");
			text = string_replace_all(text, "He ", "They ");
			text = string_replace_all(text, "His ", "Their ");
			text = string_replace_all(text, "He's ", "They're ");
			text = string_replace_all(text, " doesn't ", " don't ");
		}
	}
	
	// do the thing
	if tv_default_condition()
	{
	    if !in_saveroom()
	    {
			if check_sugarychar()
				tv_spr = spr_tv_failsafeSP; // lmfao
	        prompt_array[0] = [text, special, tv_spr, scroll];
	        tv_push_prompt_array(prompt_array);
	        add_saveroom();
	        instance_destroy();
	    }
	}
}
else if (prompt_array != noone && prompt_condition != noone && prompt_condition())
{
	if !in_saveroom()
	{
		tv_push_prompt_array(prompt_array);
		add_saveroom();
		instance_destroy();
	}
}
