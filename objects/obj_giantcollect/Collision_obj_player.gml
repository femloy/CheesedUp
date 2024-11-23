if (other.state != states.gotoplayer)
{
	fail_modifier(MOD.NoToppings);
	if (obj_player1.character == "V")
		global.playerhealth = 100;
	global.heattime = 60;
	global.combotime = 60;
	with obj_camera
		healthshaketime = 120;
	
	scr_sound_multiple(global.snd_collect, x, y);
	sound_play(global.snd_collectgiantpizza);
	
	if !global.snickchallenge
	{
		var val = heat_calculate(1000);
		if (other.object_index == obj_player1)
			global.collect += val;
		else
			global.collectN += val;
	
		var _x = x - 48;
		var _y = y - 48;
		var _xstart = _x;
		for (var yy = 0; yy < 4; yy++)
		{
			for (var xx = 0; xx < 4; xx++)
			{
				spr_palette = noone;
				paletteselect = 0;
			
				var spr = scr_collectspr(obj_collect, , false);
				create_collect(_x, _y, spr, 0, spr_palette, paletteselect);
				_x += 16;
			}
			_x = _xstart;
			_y += 16;
		}
		with (instance_create(x, y, obj_smallnumber))
			number = string(val);
	}
	
	instance_destroy();
}
