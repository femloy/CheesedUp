function get_level_achievements(lvl)
{
	var opened_ini = gamesave_open_ini();
	
	var boss = false;
	if string_starts_with(lvl, "b_")
	{
		lvl = string_replace(lvl, "b_", "");
		boss = true;
	}
	
	var struct =
	{
		sprite: boss ? spr_achievement_bosses : (SPRITES[? $"spr_achievement_{lvl}"] ?? spr_achievement_entrance),
		achievements: []
	};
	
	if !boss
	{
		if lvl == "plage"
			struct.sprite = spr_achievement_beach;
		if lvl == "minigolf"
			struct.sprite = spr_achievement_golf;
		
		var len = sprite_get_number(struct.sprite) / 2;
		for (var i = 0; i < len; i++)
	    {
	        var entry = concat("achievement_", lvl, i + 1);
	        var got = !opened_ini ? true : ini_read_real("achievements", concat(lvl, i + 1), false);
			
			var a =
			{
	            name: lang_get_value(concat(entry, "title")),
	            description: lang_get_value_newline(entry),
	            got: got,
				image_index: i
	        };
			
			switch struct.sprite
			{
				case spr_achievement_farm:
					if i == 0
						a.image_index = 2;
					else if i == 2
						a.image_index = 0;
					break;
				case spr_achievement_space:
					if i == 1
						a.image_index = 2;
					else if i == 2
						a.image_index = 1;
					break;
			}
			
			if !got
				a.image_index += len;
			
	        array_push(struct.achievements, a);
	    }
	}
	else
	{
		var ix = -1;
		switch lvl
		{
			case "pepperman": ix = 0; break;
		    case "vigilante": ix = 1; break;
		    case "noise": ix = 2; break;
		    case "fakepep": ix = 3; break;
		    case "pizzaface": ix = 4; break;
		}
		
		var len = sprite_get_number(struct.sprite) / 2;
		var entry = concat("achievement_", lvl);
	    var got = !opened_ini ? true : ini_read_real("achievements", lvl, false);
		
		var a =
		{
	        name: lang_get_value(concat(entry, "title")),
	        description: lang_get_value_newline(entry),
	        image_index: ix,
	        got: got
	    };
		
		if !got
			a.image_index += len;
		
	    array_push(struct.achievements, a);
	}
	
	if opened_ini
		gamesave_close_ini(false);
	
	return struct;
}
