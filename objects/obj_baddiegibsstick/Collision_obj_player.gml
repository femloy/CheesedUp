live_auto_call;

if global.gerome
{
	fail_modifier(MOD.NoToppings);
	
	scr_sound_multiple(global.snd_collect, x, y);
	global.combotime = min(global.combotime + 30, 60);
	
	if !global.snickchallenge
	{
		var val = heat_calculate(10 + floor(global.combo * 0.5));
		global.collect += val;
		create_collect(x, y, sprite_index, val);
		with instance_create(x, y, obj_smallnumber)
			number = string(val);
	}
	instance_destroy();
	
	instance_destroy(obj_geromeanim);
	instance_create(other.x, other.y, obj_geromeanim);
}
