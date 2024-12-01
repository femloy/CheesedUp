SS_CODE_START;

if !global.panic
{	
	if REMIX && global.jukebox == noone
	{
		anim_t = Approach(anim_t, 1, .065);
		image_angle = lerp(desired_angle - degree_per_beat, desired_angle, animcurve_channel_evaluate(outback, anim_t));
	}
	else
		image_angle += (abs(sin(scr_current_time() / 625) * rotspd) * sign(image_xscale));
}
else
	image_angle += (rotspd * 2 * sign(image_xscale));

SS_CODE_END;
