live_auto_call;

levelarray = array_create(0);
show = false;
text_xscale = (SCREEN_WIDTH - 64) / sprite_get_width(spr_tutorialbubble);
text_yscale = 2;
text_y = -(sprite_get_height(spr_tutorialbubble) * text_yscale);
text_sprite_height = sprite_get_height(spr_tutorialbubble);
text_xpad = 0;
text_state = states.titlescreen;
text_ystart = 16;
text_vsp = 0;
text_wave_x = 0;
text_wave_y = 0;
tex_x = 0;
surfclip = -4;
surffinal = -4;
depth = 0;
wave_timer = 0;

scroll = 0;
next_page = function()
{
	sound_play_3d(sfx_stompenemy, x, y);
	scroll += 5;
	if scroll >= array_length(levelarray)
		scroll = 0;
	update_xpad();
}
update_xpad = function()
{
	level_xpad = (sprite_get_width(spr_tutorialbubble) * text_xscale) / (min(array_length(levelarray) - scroll, 5) + 1);
}
tip = noone;
tip_y = -64;
