function scr_pizzaface_laugh(unrelated = false)
{
	if SUGARY_SPIRE && check_sugary()
		sound_play("event:/modded/sfx/coneballlaugh");
	else if BO_NOISE && MIDWAY
		sound_play("event:/modded/sfx/bonoiselaugh");
	else if REMIX && !unrelated
		sound_play_centered(sfx_box);
	else
		sound_play("event:/sfx/pizzaface/laugh");
}
