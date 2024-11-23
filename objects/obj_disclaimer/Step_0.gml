live_auto_call;

if instance_exists(obj_loadingscreen)
	exit;

camera_set_view_pos(view_camera[0], -floor(SCREEN_WIDTH / 2 - 960 / 2), -floor(SCREEN_HEIGHT / 2 - 540 / 2))

// restart the disclaimer if you turn on your internet
if !net && net != os_is_network_connected(true)
	room_restart();

if DEBUG && keyboard_check_pressed(ord("R"))
	room_restart();

// animation
if (menu == 1 && state == 2) or menu == 2 or (menu == 4 && state == 1)
{
	var played = t > 0;
	
	t = Approach(t, 1, 0.075);
	size = animcurve_channel_evaluate(outback, t);
	
	if t > 0 && !played
		sound_play("event:/modded/sfx/diagopen");
}

// check if in server
if menu == 4
{
	if YYC
	{
		fade_alpha -= 0.1;
		if state == 0 && obj_richpresence.active == false && obj_richpresence.alarm[0] > 0
		{
			state = 1;
			str = lstr("disclaimer_discord_error");
		}
		else if state == 0 && obj_richpresence.userid != "" && req == -1
		{
			// https://play.cheesedup.lol/in_server.php
			var base_link = base64_decode("aHR0cHM6Ly9wbGF5LmNoZWVzZWR1cC5sb2wvaW5fc2VydmVyLnBocA=="); //"http://localhost:8000/api/verify"
			var v = GM_version;
			if PLAYTEST
				v = "P" + v;
			req = http_get($"{base_link}?{"id"}={obj_richpresence.userid}&{"v"}={v}");
		}
		else if state == 0
		{
			timeout--;
			if timeout <= 0
			{
				state = 1;
				audio_play_sound(sfx_pephurt, 0, false);
			
				str = lstr("disclaimer_discord_error2");
			}
		}
		else if state == 1
		{
			if keyboard_check_pressed(ord("R")) && req != -2
			{
				if !obj_richpresence.active
					obj_richpresence.alarm[0] = 1;
				room_restart();
			}
		}
		else if state == 2
		{
			t = 1;
			x += 1;
		
			if x >= 250
			{
				fade_alpha = max(fade_alpha + 0.2, 0);
				if fade_alpha >= 2
				{
					menu = 0;
					confirm = true;
					size = 0;
					t = 0;
				}
			}
		}
	}
}

// firstboot sequence
else if menu == 0
{
	fade_alpha -= 0.1;
	if state == 1
		scr_menu_getinput();
	else if state == 2
	{
		// check if firstboot
		ini_open(game_save_id + "saveData.ini");
		var discl = (!ini_read_real("Modded", "disclaimer", false)/* or PLAYTEST*/) && global.disclaimer_section < 2;
		ini_close();
		
		if discl
		{
			disclaimer = {};
			
			draw_set_font(lang_get_font("creditsfont"));
			disclaimer.header = scr_compile_icon_text(lstr("disclaimer_title"));
			disclaimer.header_size = scr_text_arr_size(disclaimer.header);
			disclaimer.wait = room_speed * 3;
			
			t = 1;
			state = 1;
			
			scr_menu_getinput();
		}
		else
		{
			fade_alpha = 2;
			state = 3;
		}
	}
	
	// go
	else if state == 3
	{
		if YYC
		{
			if !confirm && !DEBUG // impossible
			{
				trace("FUNNYROOM - state 3 without var (obj_disclaimer)");
				instance_create(0, 0, obj_softlockcrash);
			}
			
			global._ = [];
			array_copy(global._, 0, global.__, 0, 8);
		}
		
		state = -1;
		
		// REMOVE THIS
		/*
		show_message("Thank you the game will work for you now");
		game_end();
		*/
		
		room_goto(Realtitlescreen);
	}
	else if state == -1 or state == -2
	{
		
	}
	else if YYC
	{
		if confirm && !DEBUG // impossible
		{
			trace("FUNNYROOM - var without state 3 (obj_disclaimer)");
			instance_create(0, 0, obj_softlockcrash);
		}
	}
}
else if menu == 2 // playtest
	fade_alpha = Approach(fade_alpha, 0, 0.1);
else if menu == 3 // crash handler
{
	if state == 2
		fade_alpha = Approach(fade_alpha, 3, 0.2);
	else
		fade_alpha = Approach(fade_alpha, 0, 0.1);
	
	scr_menu_getinput();
	if (key_jump or keyboard_check_pressed(vk_enter))
	&& state != 2
	{
		sound_play("event:/modded/sfx/diagclose");
		state = 2;
	}
	
	if state == 2 && fade_alpha >= 3
	{
		file_delete(game_save_id + "crash_log.txt");
		file_delete(game_save_id + "crash_img.png");
		
		room_restart();
		
		/*
		fade_alpha = 1;
		menu = 0;
		state = 2;
		confirm = true;
		size = 0;
		t = 0;
		*/
	}
}

if YYC
{
	if state != -1
	{
		// drm
		if !is_array(global._)
		{
			trace("FUNNYROOM - globalvar not an array (obj_disclaimer)");
			instance_create(0, 0, obj_softlockcrash);
		}
		for(var i = 1; i < 8; i++)
		{
			if global._[i] != false
			{
				trace("FUNNYROOM - globalvar doesnt check out (obj_disclaimer)");
				instance_create(0, 0, obj_softlockcrash);
			}
		}
	}
}
