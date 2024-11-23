image_speed = 0.35;
hsp = image_xscale * 10;
if ((x + hsp) > room_width || (x + hsp) < 0 || (check_solid(x + sign(hsp), y) && !check_slope(x + sign(hsp), y)))
	image_xscale *= -1;
mask_index = spr_player_mask;
var _index = floor(image_index) == (image_number - 1);
if (sprite_index == spr_brickchase)
	_index = floor(image_index) == 7;
if (_index && !steppy)
{
	steppy = true;
	create_particle(x, y + 43, part.cloudeffect);
}
else if (!_index)
	steppy = false;
scr_collide();

visible = !check_char("G");

if ((instance_exists(obj_titlecard) or instance_exists(obj_fadeout))
&& !(!REMIX && sprite_index == spr_brickchase)) or !visible
{
	fmod_event_instance_stop(snd, true);
	fmod_event_instance_stop(sniffsnd, true);
}
else if (sprite_index == spr_brickchase)
{
	if (!fmod_event_instance_is_playing(sniffsnd))
		fmod_event_instance_play(sniffsnd);
	sound_instance_move(sniffsnd, x, y);
}
else if (sprite_index == spr_gustavochase)
{
	if (!fmod_event_instance_is_playing(snd))
		fmod_event_instance_play(snd);
	sound_instance_move(snd, x, y);
}
