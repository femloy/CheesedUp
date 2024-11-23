if !start_sound
{
	fmod_set_parameter("masterVolume", global.option_master_volume, true);
	fmod_set_parameter("musicVolume", global.option_music_volume, true);
	fmod_set_parameter("sfxVolume", global.option_sfx_volume, true);
}
