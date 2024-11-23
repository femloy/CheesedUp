timer = round(timer_max);
if BO_NOISE
{
	if bo && !instance_exists(obj_endlevelfade)
	{
		var title = floor(combo / 5);
		if title > sprite_get_number(sprite) / 2
			title -= sprite_get_number(sprite) / 2;
	
		if title >= 0 && title <= 21
			sound_play($"event:/modded/sfx/comboBN/{title + 1}"); 
		else
			sound_play("event:/modded/sfx/comboBN/0");
	}
}
