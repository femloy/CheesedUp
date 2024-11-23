function check_kungfu_state(who = id)
{
	with who
		return (state == states.punch && string_pos("kungfu", sprite_get_name(sprite_index)) > 0);
}
