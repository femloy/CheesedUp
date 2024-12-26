/// @func calculate_panic_timer(minutes, seconds)
/// @desc Calulcates the panic timer from given minutes and seconds and returns the given time in frames
/// @param {Real}	_minutes	How many minutes should be given?
/// @param {Real}	_seconds	How many seconds should be given?
/// @returns	{Real}
function calculate_panic_timer(_minutes = 5, _seconds = 30)
{
	return (((_minutes * 60) + _seconds) * 60) * 0.2;
}
function activate_panic(instapanic = false, debris = noone)
{
	if room == tower_finalhallway
		global.leveltosave = "exit";
	
	/*
	with obj_baddie
	{
		if escape
		{
			visible = true;
			create_particle(x, y, part.genericpoofeffect);
		}
	}
	*/
	
	instance_activate_object(obj_metalblock_escape);
	instance_activate_object(obj_destroyable_escape);
	instance_activate_object(obj_destroyable2_escape);
	instance_activate_object(obj_destroyable2_bigescape);
	instance_activate_object(obj_destroyable3_escape);
	instance_activate_object(obj_deathcollectescape);
	
	notification_push(notifs.hungrypillar_dead, [room]);
	if !instapanic
	{
		fmod_event_instance_play(global.snd_escaperumble);
		if IT_hungrypillarflash()
		{
			fmod_event_instance_play(global.snd_johndead);
			with instance_create_unique(0, 0, obj_hungrypillarflash)
				debrisid = debris;
		}
		instance_create(0, 0, obj_itspizzatime);
		
		with obj_camera
			alarm[1] = 60;
		shake_camera(3, 3 / room_speed);
		
		with obj_deathmode
			time_fx = 30;
	}
	
	global.fill = 4000;
	if instance_exists(obj_cyop_loader)
	{
		global.minutes = floor(global.cyop_fill / 60);
        global.seconds = global.cyop_fill % 60;
        global.fill = (global.cyop_fill * 60) * 0.2;
	}
	else switch room
	{
		case entrance_10:
			global.fill = 1860;
			break;
		case medieval_10:
			global.fill = 2040;
			break;
		case ruin_11:
			global.fill = 2160;
			break;
		case dungeon_10:
			global.fill = 2460;
			if check_char("G")
				global.fill *= 1.2;
			break;
		case badland_9:
			global.fill = 2556;
			break;
		case graveyard_6:
			global.fill = 2640;
			break;
		case farm_11:
			global.fill = 1920;
			break;
		case saloon_6:
			global.fill = 2100;
			break;
		case plage_cavern2:
			global.fill = 2220;
			break;
		case forest_john:
			global.fill = 2520;
			break;
		case space_9:
			global.fill = 2220;
			break;
		case minigolf_8:
			global.fill = 3240;
			break;
		case street_john:
			global.fill = 2280;
			break;
		case sewer_8:
			global.fill = 3300;
			var lay = layer_get_id("Backgrounds_scroll");
			layer_set_visible(lay, true);
			break;
		case industrial_5:
			global.fill = 2760;
			break;
		case freezer_escape1:
			global.fill = 2640;
			break;
		case chateau_9:
			lay = layer_get_id("Backgrounds_stillH1");
			layer_background_sprite(layer_background_get_id(lay), spr_chateaudarkbg_escape);
			global.fill = 2520;
			break;
		case kidsparty_john:
			global.fill = 2460;
			break;
		case tower_finalhallway:
			global.fill = 4056;
			break;
		
		// pto
		case strongcold_1:
			global.fill = 3240;
			break;
		case grinch_1:
			global.fill = 2148;
			break;
		case etb_8:
			global.fill = calculate_panic_timer(1, 30);
			break;
		case ancient_20:
			global.fill = 1860;
			break;
		case secret_entrance:
			global.fill = calculate_panic_timer(0, array_length(obj_randomsecret.levels) * 16);
			break;
		
		// sugary
		case entryway_11:
			global.fill = 2500;
			break;
		case steamy_12:
			global.fill = calculate_panic_timer(3, 00);
			break;
		case molasses_9:
			global.fill = calculate_panic_timer(3, 00);
			break;
		case sucrose_1:
		case sucrose_2:
			global.fill = calculate_panic_timer(0, 30);
			break;
	}
	scr_modifier_fill();
	
	with obj_tv
	{
		chunkmax = global.fill;
		fill_lerp = global.fill;
	}
	with obj_escapecollect
	{
		gotowardsplayer = false;
		movespeed = 5;
		image_alpha = 1;
	}
	with obj_escapecollectbig
		image_alpha = 1;
	
	global.wave = 0;
	global.maxwave = global.fill;
	
	with obj_persistent
		event_user(1);
	
	global.panic = true;
}
function activate_snickchallenge()
{
	if !global.snickchallenge
	{
		global.fill = calculate_panic_timer(9, 59); // 9:59
		if (MOD.Pacifist) or (MOD.NoToppings)
			global.fill *= 3;
		
		with obj_tv
		{
			chunkmax = global.fill;
			fill_lerp = global.fill;
		}
			
		global.wave = 0;
		global.maxwave = global.fill;
			
		global.snickchallenge = true;
		global.collect = 10000;
			
		with obj_camera
			alarm[1] = 60;
	}
	instance_create_unique(room_width / 2, -50, obj_snickexe);
	/*
	if room == ruin_1 && global.snickrematch && global.snickchallenge
		instance_create_unique(room_width / 2, -50, obj_snickexf);
	if room == dungeon_1 && global.snickrematch && global.snickchallenge
	{
		instance_create_unique(room_width / 2, -50, obj_snickexg);
		instance_create_unique(room_width / 2, -50, obj_snickexh);
	}
	*/
}
