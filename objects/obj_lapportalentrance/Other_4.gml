var p = false;
with obj_player
{
	if targetDoor == "LAP" or targetDoor == "TIMED"
	{
		p = true;
		state = states.actor;
		x = other.x;
		y = other.y;
		roomstartx = x;
		roomstarty = y;
		visible = false;
		with obj_pizzaface
		{
			x = other.x;
			y = other.y;
		}
		post_player_modifiers();
		
		if check_lap_mode(LAP_MODES.laphell)
		{
			switch global.laps
			{
				case 2:
					global.fill = 0;
					if REMIX
						global.timer_shake = 4;
					
					if !global.panic
					{
						instance_create(obj_player1.x, obj_player1.y, obj_pizzaface);
						scr_pizzaface_laugh();
					}
					
					if global.lap3checkpoint && !(is_struct(global.checkpoint_data) && global.checkpoint_data.loaded)
						set_checkpoint();
					if global.lap4checkpoint && is_struct(global.checkpoint_data)
						global.checkpoint_data.loaded = 0;
					
					if !global.in_afom
					{
						with obj_persistent
							alarm[0] = 60;
					}
					break;
				
				case 3:
					instance_create_unique(0, 0, obj_snickexe);
					
					/*
					if !(is_struct(global.checkpoint_data) && global.checkpoint_data.loaded)
					{
						// if a war timer already exists
						with obj_wartimer
						{
							addseconds = 60 * 2 + 30; // 2:30
							alarm[0] = -1;
							alarm[2] = 1;
						}
					}
					*/
					
					with obj_persistent
						alarm[0] = -1;
					
					with instance_create_unique(0, 0, obj_wartimer)
					{
						switch global.leveltosave
						{
							// no timer
							default:
								if instance_exists(obj_cyop_loader) && global.in_afom
								{
									minutes = floor(global.lap4time / 60);
									seconds = global.lap4time % 60;
								}
								else
								{
									global.lap4time = ceil(global.lap4time / 10) * 10;
									minutes = floor(global.lap4time / 60);
									seconds = global.lap4time % 60;
								}
								break;
							
							// pt
							case "entrance":
							    minutes = 1;
							    break;
							case "medieval":
							    minutes = 1;
							    seconds = 30;
							    break;
							case "ruin":
							    minutes = 1;
							    seconds = 30;
							    break;
							case "dungeon":
							    minutes = 2;
							    break;
							case "badland":
							    minutes = 2;
							    break;
							case "graveyard":
							    minutes = 2;
							    break;
							case "farm":
							    minutes = 1;
							    break;
							case "saloon":
							    minutes = 1;
							    seconds = 30;
							    break;
							case "plage":
							    minutes = 1;
							    seconds = 30;
							    break;
							case "forest":
							    minutes = 2;
							    break;
							case "space":
							    minutes = 1;
							    seconds = 30;
							    break;
							case "minigolf":
							    minutes = 2;
							    seconds = 30;
							    break;
							case "street":
							    minutes = 1;
							    seconds = 30;
							    break;
							case "sewer":
							    minutes = 2;
							    seconds = 30;
							    break;
							case "industrial":
							    minutes = 2;
							    break;
							case "freezer":
							    minutes = 2;
							    break;
							case "chateau":
							    minutes = 2;
							    break;
							case "kidsparty":
							    minutes = 2;
							    break;
							case "exit":
							    minutes = 3;
							    seconds = 30;
							    break;
							
							// pto
							case "sucrose":
								minutes = 3;
								break;
							case "etb":
								minutes = 1;
								break;
							case "entryway":
								minutes = 1;
								seconds = 30;
								break;
							case "ancient":
								seconds = 60;
								break;
						}
					}
					
					if global.lap4checkpoint && !(is_struct(global.checkpoint_data) && global.checkpoint_data.loaded)
						set_checkpoint();
					break;
			}
		}
	}
}
if !p
	instance_destroy();
else
	active = true;
