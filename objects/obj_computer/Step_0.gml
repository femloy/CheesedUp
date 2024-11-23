if place_meeting(x, y, obj_player1) && obj_player1.key_up2
{
	text++;
	sound_play_3d("event:/sfx/misc/computerswitch", x, y);
	if text >= 3 // 2
		text = global.sandbox ? 1 : 0;
	update_text();
}
