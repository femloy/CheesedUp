function pal_swap_supernoise(enable = undefined)
{
	if enable == undefined && instance_exists(obj_player1) && obj_player1.character == "N"
	{
		if REMIX && (obj_player1.isgustavo or obj_player1.noisecrusher)
			enable = 2;
		else if (instance_exists(obj_pizzaface_thunderdark) && room == boss_pizzaface) or (DEBUG && keyboard_check(ord("1")))
			enable = 1;
	}
	shader_set_uniform_i(global.Pal_Super_Noise, enable ?? 0);
}
