if (room == rm_editor)
	exit;
if !in_saveroom()
{
	fail_modifier(MOD.NoToppings);
	
	scr_sleep(5);
	with (instance_create(x + 32, y + 32, obj_parryeffect))
		sprite_index = other.spr_dead;
	
	if (sprite_exists(particlespr))
	{
		repeat (6)
			create_debris(x + sprite_width / 2, y + sprite_height / 2, particlespr);
	}
	
	if (content == obj_null)
	{
		global.heattime = clamp(global.heattime + 50, 0, 60);
		global.combotime = clamp(global.combotime + 50, 0, 60);
		
		if !global.snickchallenge
		{
			var val = heat_calculate(100);
			global.collect += val;
			scr_sound_multiple(global.snd_collect, x, y);
			with (instance_create(x + 16, y, obj_smallnumber))
				number = string(val);
		}
	}
	else
		instance_create(x + 32, y, content);
	repeat (3)
		create_baddiegibsticks(x + 32, y + 32);
	notification_push(notifs.block_break, [room]);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	add_saveroom();
}
