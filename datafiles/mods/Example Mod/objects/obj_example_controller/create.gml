persistent = true;
sprite_index = spr_player_idle;
depth = -100;

// For testing, you can remove this of course
trace();
trace("Example object name: ", __OBJECT.name); 	// (obj_example_controller)
trace("Mod path: ", MOD_PATH); 					// (...\mods\example)
trace("states.normal: ", states.normal); 		// (0)
trace("SCREEN_WIDTH: ", SCREEN_WIDTH); 			// (960)
trace("REMIX: ", REMIX); 						// (0 or 1)
trace();
