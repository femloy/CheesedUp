// Runs when the game boots up (if enabled), and/or when the mod is re-enabled

sprite_replace(spr_player_idle, MOD_PATH + "/sprites/notawesome.png", 1, false, false, 50, 50);
//sprite_assign(spr_player_idle, spr_player_notawesome);

// Any objects you add will be accessible normally, no quotation marks
instance_create(0, 0, obj_example_controller);

// "Example mod enabled" message box
show_message(lang_get_value("test_string"));
