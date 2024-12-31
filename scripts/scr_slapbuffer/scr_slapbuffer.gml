function scr_resetslapbuffer()
{
	input_buffer_slap = 0;
	input_buffer_grab = 0;
}

function scr_slapbuffercheck()
{
	return input_buffer_slap > 0 or input_buffer_grab > 0
}

function scr_slapcheck()
{
	if global.attackstyle == MOD_MOVES.grab
		return key_slap;
	return key_slap or key_chainsaw;
}
function scr_slapcheck2()
{
	if global.attackstyle == MOD_MOVES.grab
		return key_slap2;
	return key_slap2 or key_chainsaw2;
}
