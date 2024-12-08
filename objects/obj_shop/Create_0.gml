live_auto_call;

open_menu();
scr_init_input();

state = 0;
image_speed = 0.35;

fade = 0;
fadein = true;

dialog_state = 0;
dialog_image = 0;
dialog = "Welcome to me.";
dialog_previous = "";
dialog_formatted = "";
dialog_pos = 0;
dialog_delay = 0;

format_dialog = function(dialog)
{
	var space_last = string_pos(" ", dialog), xx = 0;
	for(var i = 1; i <= string_length(dialog); i++)
	{
		var char = string_char_at(dialog, i);
		if char == "\n"
		{
			xx = 0;
			continue;
		}
		else if char == " "
			space_last = i;
		
		if xx > 260 && space_last > 0
		{
			i = space_last;
			xx = 0;
			
			dialog = string_set_byte_at(dialog, space_last, ord("\n"));
		}
		
		xx += string_width(char);
	}
	return dialog;
}

sign_state = 0;
sign_vsp = 0;
sign_y = -540;

// items
item_sprite = noone;
item_spr_palette = noone;
item_pattern = noone;
item_color_array = [1, 2];
item_paletteselect = 0;
item_offset = { x: 0, y: 0 };
item_image = 0;
item_name = "";

sel_category = 0;
sel = 0;

hats = [];
pets = [];
clothes = [];

add_hat = function(entry, local, offset = { x: 0, y: 50 })
{
	var s = 
	{
		hat: entry,
		sprite: scr_hat_sprites(entry),
		local: local,
		name: lstr(concat("hat_", local, "title")),
		desc: lstr(concat("shop_hat_", local)),
		offset: offset
	};
	
	array_push(hats, s);
	return s;
}

add_hat(HAT.dunce, "dunce");
add_hat(HAT.crown, "golden", { x: 0, y: 75 });
add_hat(HAT.uwunya, "uwunya", { x: 0, y: -20 });
add_hat(HAT.dougdimmadome, "dougdimmadome");
add_hat(HAT.boobs, "boobs");
add_hat(HAT.dunit, "dunit", { x: 0, y: -10 });
