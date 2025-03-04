add_saveroom();
with obj_pumpkincounter
    counter--;

sound_play("event:/sfx/misc/collecttoppin");
if !trickytreat
{
	scr_fmod_soundeffect(global.snd_breakblock, x, y);
	repeat 7
	    create_debris(bbox_left + ((bbox_right - bbox_left) / 2), bbox_top + ((bbox_bottom - bbox_top) / 2), spr_pumpkinchunks);
}
else
	instance_create(bbox_left, bbox_top, obj_pumpkineffect);

if gamesave_open_ini()
{
	if active
	{
	    var count = ini_read_real("halloween", "pumpkincount", 0) + 1;
	    ini_write_real("halloween", "pumpkincount", count);
	    ini_write_real("halloween", room_get_name(room), true);
	    gamesave_close_ini(true);
	    gamesave_async_save();
		
	    notification_push(notifs.pumpkin_collect, [count]);
	    var txt = lang_get_value("pumpkin_text2");
	    if count <= 1
	        txt = lang_get_value("pumpkin_text1");
	    txt = embed_value_string(txt, [count]);
	    create_transformation_tip(txt);
	}
	else
	{
	    count = ini_read_real("halloween", "pumpkincount", 0);
	    gamesave_close_ini(false);
	    notification_push(notifs.pumpkin_collect, [count]);
	}
}
