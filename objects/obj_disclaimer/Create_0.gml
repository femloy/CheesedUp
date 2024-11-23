live_auto_call;

state = 0;
confirm = false;
fade_alpha = 1;
crash_image = noone;
crash_msg = noone;
disclaimer = noone;
timeout = 60 * 60 * 1; // 1 minute

// menus
count = 0;
pto_textbox_init();

image_speed = 0.35;
menu = 0;
sel = 0;

options = noone;
saves = array_create(3, noone);
selected = [0, 0, 0, 0];
pizzashift = [0, 0];

// box
size = 0;
surf = noone;
t = 0;

outback = animcurve_get_channel(curve_menu, "outback");
incubic = animcurve_get_channel(curve_menu, "incubic");

// check availability
req = -1;
str = lstr("disclaimer_no_internet");

if file_exists(game_save_id + "crash_log.txt") && (!PLAYTEST or global.disclaimer_section != 0)
{
	var file = buffer_load(game_save_id + "crash_log.txt");
	try
	{
		crash_msg = json_parse(buffer_read(file, buffer_text), undefined, undefined);
		
		draw_set_font(lang_get_font("creditsfont"));
		text = scr_compile_icon_text(lstr("disclaimer_crash2"));
		crash_image = sprite_add("crash_img.png", 1, 0, 0, 0, 0);
		
		menu = 3;
		net = true;
	}
	catch (e)
	{
		trace($"Failed to crash the log idiot {e}");
		file_delete(game_save_id + "crash_log.txt");
		room_restart();
	}
	buffer_delete(file);
}
else if !PLAYTEST or global.disclaimer_section != 0
{
	net = true;
	state = 2;
	confirm = true;
}
else if PLAYTEST
{
	// playtest login page
	menu = 2;
	state = 1;
	net = true;
	str = "This is a playtester build for the mod.\nDo not share it anywhere.";
}
