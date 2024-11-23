function draw_text_special(x, y, text, data)
{
	//if live_call(x, y, text, data) return live_result;
	
	var strlen = string_length(text);
	var xx = x, yy = y;
	var halign = draw_get_halign(), valign = draw_get_valign();
	var sepV = data[$ "sepV"] ?? string_height("A"), w = data[$ "w"];
	var shake = data[$ "shake"] ?? 0;
	var color = draw_get_colour();
	
	tdp_draw_set_align(fa_left, fa_top);
	var actions = [];
	
	// prep
	var strW = string_width(text), strH = string_height(text);
	if w != undefined
	{
		strW = string_width_ext(text, sepV, w);
		strH = string_height_ext(text, sepV, w);
		
		var last_space = string_pos(" ", text);
		xx = 0;
		
		for(var i = 1; i <= strlen; i++)
		{
			var char = string_char_at(text, i);
			if char == "\n"
			{
				xx = 0;
				continue;
			}
			else if char == " "
				last_space = i;
			
			if xx > w
			{
				i = last_space;
				xx = 0;
				
				text = string_delete(text, i, 1);
				text = string_insert("\n", text, i); 
			}
			
			xx += string_width(char);
		}
	}
	
	// turn to actions
	for(var i = 1; i <= strlen; i++)
	{
		var effect_start = string_pos_ext("{", text, i);
		var next_line = string_pos_ext("\n", text, i);
		
		if effect_start != 0
		&& (effect_start < next_line or next_line == 0)
		{
			array_push(actions, string_copy(text, i, effect_start - i));
			
			var effect_end = string_pos_ext("}", text, i);
			if effect_end == 0
			{
				actions = ["Unclosed effect frame"];
				break;
			}
			
			++effect_start;
			var effect = string_split(string_replace_all(string_copy(text, effect_start, effect_end - effect_start), " ", ""), ",", false, infinity);
			switch effect[0]
			{
				// colors
				case "c_red": array_push(actions, [1, c_red]); break;
				case "c_gray": array_push(actions, [1, c_gray]); break;
				
				// keys
				case "C": array_push(actions, [2, tdp_get_tutorial_icon("player_chainsaw")]); break;
				case "S": array_push(actions, [2, tdp_get_tutorial_icon("player_shoot")]); break;
				case "G": array_push(actions, [2, tdp_get_tutorial_icon("player_slap")]); break;
			}
			
			i = effect_end;
			continue;
		}
		
		if next_line == 0
		{
			array_push(actions, string_copy(text, i, strlen + 1 - i));
			break;
		}
		
		array_push(actions, string_copy(text, i, next_line - i));
		array_push(actions, [0]);
		
		i = next_line;
	}
	if array_length(actions) == 0
		exit;
	
	// alignment
	xx = x;
	if halign == fa_center or halign == fa_right
	{
		var j = 0, action = actions[j], len = array_length(actions);
		var this_line = "", x_offset = 0;
		
		while typeof(action) == "string" or action[0] != 0
		{
			if typeof(action) == "string"
				this_line += action;
			else if action[0] == 2
				x_offset += 16;
			
			if j + 1 >= len
				break;
			action = actions[++j];
		}
		xx = x - round((string_width(this_line) + x_offset) / (halign == fa_right ? 1 : 2));
	}
	if valign == fa_middle or valign == fa_bottom
		yy -= strH / (valign == fa_bottom ? 1 : 2);
	
	// action drawer
	var col_prev = draw_get_colour();
	for(var i = 0, len = array_length(actions); i < len; i++)
	{
		var action = actions[i];
		if typeof(action) == "string"
		{
			if shake != 0
			{
				for(var j = 1; j <= string_length(action); j++)
				{
					var char = string_char_at(action, j);
					tdp_draw_text_color(xx + random_range(-shake, shake), yy + random_range(-shake, shake), char, color, color, color, color, draw_get_alpha());
					xx += string_width(char);
				}
			}
			else
			{
				tdp_draw_text_color(xx, yy, action, color, color, color, color, draw_get_alpha());
				xx += string_width(action);
			}
		}
		else switch action[0]
		{
			case 0: // line break
				if i >= len - 1
					break;
				
				var j = i + 1, action = actions[j], len = array_length(actions);
				var this_line = "", x_offset = 0;
				
				while typeof(action) == "string" or action[0] != 0
				{
					if typeof(action) == "string"
						this_line += action;
					else if action[0] == 2
						x_offset += 16;
					
					if j + 1 >= len
						break;
					action = actions[++j];
				}
				
				xx = x - round((string_width(this_line) + x_offset) / (halign == fa_right ? 1 : 2));
				yy += sepV;
				break;
			
			case 1: // color
				color = action[1];
				break;
			
			case 2: // button
				var xo = -6;
				if action[1].sprite_index == spr_gamepadbuttons_style1
					xo = -9;
				draw_sprite(action[1].sprite_index, action[1].image_index, xx + xo, yy - 7);
				
				if action[1].str != ""
				{
					var font_prev = draw_get_font();
					
					draw_set_font(global.tutorialfont);
					draw_set_halign(fa_center);
					draw_text_color(xx + 10, yy - 17, action[1].str, 0, 0, 0, 0, 1);
					draw_set_halign(fa_left);
					draw_set_font(font_prev);
				}
				
				xx += 16;
				break;
		}
	}
	
	tdp_draw_set_align(halign, valign);
	draw_set_colour(col_prev);
}
