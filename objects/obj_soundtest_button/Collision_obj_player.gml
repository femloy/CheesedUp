if (other.key_up2 && other.grounded && other.vsp > 0 && func != noone)
{
	sound_play_3d("event:/sfx/fakepep/step", x, y);
	func();
}
