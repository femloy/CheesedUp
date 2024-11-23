live_auto_call;

// window title
if global.gameframe_enabled
	gameframe_update();
else
	window_set_caption(gameframe_caption_text);

// unfocused audio
var focus = window_has_focus() or !global.option_unfocus_mute or instance_exists(obj_disclaimer);
audio_master_gain(focus * global.option_master_volume);
fmod_set_parameter("focus", focus, false);

// pattern animation
global.Pattern_Index += 0.1;
