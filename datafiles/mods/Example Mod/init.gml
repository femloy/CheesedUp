// Runs when the game boots up (if enabled), and/or when the mod is re-enabled

sprite_replace(spr_player_idle, MOD_PATH + "/sprites/notawesome.png", 1, false, false, 50, 50);

// Any objects you add will be accessible normally, no quotation marks
instance_create(0, 0, obj_example_controller);

// "Example mod enabled" message box, to show off custom language entries
// Please don't actually do this in mods
show_message(lang_get_value("test_string"));

// Mod scope globals
MOD_GLOBAL.shake_intensity = 5;
