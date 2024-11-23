live_auto_call;
ensure_order;

var j = 0;
var m = menus[menu];

if instance_exists(obj_keyconfig)
	j = 4;

switch m.menu_id
{
	case MENUS.audio:
		j = 1;
		break;
	
	case MENUS.video: case MENUS.window: case MENUS.resolution: case MENUS.unused_1:
		j = 2;
		break;
	
	case MENUS.game:
		j = 3;
		break;
	
	case MENUS.controls: case MENUS.controller: case MENUS.keyboard: case MENUS.unused_3:
	case MENUS.inputdisplay:
		j = 4;
		break;
}

if safe_get(obj_modconfig, "visible")
	j = obj_modconfig.options_bg;
if instance_exists(obj_hudcustomizer)
{
	j = 5;
	darken_bg = true;
}
else
	darken_bg = false;

for (var i = 0; i < array_length(bg_alpha); i++)
{
	if i == j
		bg_alpha[i] = Approach(bg_alpha[i], darken_bg ? 0.5 : 1, 0.1);
	else
		bg_alpha[i] = Approach(bg_alpha[i], 0, 0.05);
}

bg_x -= 1;
bg_y -= 1;

if instance_exists(obj_keyconfig) or instance_exists(obj_screenconfirm) or instance_exists(obj_langselect)
or safe_get(obj_modconfig, "visible") or instance_exists(obj_hudcustomizer)
	exit;
scr_menu_getinput();

if backbuffer > 0
{
	backbuffer--;
	key_jump = false;
	key_slap2 = false;
	key_back = false;
	keyboard_clear(vk_escape);
}

var move = key_down2 - key_up2;
if (move != 0)
{
	slidebuffer = 0;
	slidecount = 0;
}

var os = optionselected;
optionselected += move;
optionselected = clamp(optionselected, 0, array_length(m.options) - 1);
if (os != optionselected)
	sound_play("event:/sfx/ui/step");

var option = m.options[optionselected];
var move2 = key_left2 + key_right2;

switch (option.type)
{
	case menutype.press:
		if (key_jump && is_callable(option.func))
		{
			sound_play("event:/sfx/ui/select");
			option.func();
		}
		break;
	
	case menutype.toggle:
		if (key_jump || -key_left2 || key_right2)
		{
			with option
			{
				sound_play("event:/sfx/ui/select");
				value = !value;
				if is_callable(on_changed)
					on_changed(value);
			}
		}
		break;
	
	case menutype.multiple:
		with option
		{
			value += move2;
			if value > array_length(values) - 1
				value = 0;
			if value < 0
				value = array_length(values) - 1;
		}
		if move2 != 0
		{
			with option
			{
				sound_play("event:/sfx/ui/step");
				if is_callable(on_changed)
					on_changed(values[value].value);
			}
		}
		break;
	
	case menutype.slide:
		move2 = key_left + key_right;
		if (move2 != 0 && slidebuffer <= 0)
		{
			option.moved = true;
			option.value += move2;
			option.value = clamp(option.value, 0, 100);
			slidebuffer = 1;
		}
		if (move2 != 0)
			option.moving = true;
		if (move2 == 0)
		{
			slidecount = 0;
			option.moving = false;
		}
		break;
}
for (i = 0; i < array_length(m.options); i++)
{
	var b = m.options[i];
	if (b.type == menutype.slide)
	{
		if (b.moved && (move2 == 0 || optionselected != i))
		{
			b.moved = false;
			b.moving = false;
			
			if (is_callable(b.on_changed))
				b.on_changed(b.value);
		}
		
		if (is_callable(b.on_move) && b.moving)
			b.on_move(b.value);
		
		if (b.sound != -4)
		{
			if (b.moving)
			{
				if !struct_get(b, "playing_sound") // dont do the obvious or it will crash
				{
					fmod_event_instance_play(b.sound);
					b.playing_sound = true;
				}
			}
			else
			{
				fmod_event_instance_stop(b.sound, true);
				b.playing_sound = false;
			}
		}
	}
}

if (menu == MENUS.main)
	scr_pauseicons_update(optionselected);
else
	scr_pauseicons_update(-1);

if (slidebuffer > 0)
	slidebuffer--;

if ((key_back || key_slap2 || keyboard_check_pressed(vk_escape)) && !instance_exists(obj_keyconfig) && !instance_exists(obj_audioconfig))
{
	sound_play("event:/sfx/ui/back");
	if (menu == MENUS.main)
	{
		with obj_mainmenuselect
			selected = false;
		with obj_mainmenu
			optionbuffer = 10;
		with obj_pause
		{
			
		}
		instance_destroy();
	}
	else
	{
		// look for back button
		var emptyhanded = true;
		for(var i = 0; i < array_length(m.options); i++)
		{
			with m.options[i]
			{
				if name == "option_back" && is_callable(func)
				{
					emptyhanded = false;
					func();
				}
			}
			if !emptyhanded
				break;
		}
		
		// fallback, old method
		if emptyhanded
		{
			for (i = 0; i < array_length(m.options); i++)
			{
				b = m.options[i];
				if b.type == menutype.slide
				{
					if b.sound != noone
						fmod_event_instance_stop(b.sound, true);
				}
			}
			menu_goto(m.backmenu);
		}
	}
}
