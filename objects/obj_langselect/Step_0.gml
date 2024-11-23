live_auto_call;

if !instance_exists(obj_option)
{
	instance_destroy();
	exit;
}

scr_menu_getinput();
if startbuffer > 0
    startbuffer--;

var move = key_left2 + key_right2;
if move != 0
{
    select += move;
    if select > array_length(lang) - 1
        select = 0;
    if select < 0
        select = array_length(lang) - 1;
    if move > 0
        right_offset = 5;
    if move < 0
        left_offset = 5;
}

left_offset = Approach(left_offset, 0, 1);
right_offset = Approach(right_offset, 0, 1);

if (key_jump || key_back) && startbuffer <= 0
{
    if key_jump
    {
		if instance_exists(obj_langload)
			exit;
		
        fmod_event_one_shot("event:/sfx/ui/select");
        ini_open_from_string(obj_savesystem.ini_str_options);
		
        if global.lang != lang[select].lang
        {
			lang_switch(lang[select].lang);
            ini_write_string("Option", "lang", global.lang);
            obj_savesystem.ini_str_options = ini_close();
            startbuffer = 10;
        }
		
		gameframe_caption_text = lstr("caption_mainmenu");
    }
    if instance_exists(obj_option)
        obj_option.backbuffer = 2;
    instance_destroy();
}
