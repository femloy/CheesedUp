function scr_timer_sprites()
{
	if global.snickchallenge
	{
		return
		{
			pizzaface1: spr_snicktimer_snick,
			pizzaface2: spr_snicktimer_snickwoke,
			pizzaface3: spr_snicktimer_snickend,
			pizzafaceback: spr_snicktimer_snickend,
			pizzafaceparry: spr_snicktimer_snickend,
			pizzafacewait: spr_snicktimer_snickend,
			tower: noone,
			
			johnface: spr_snicktimer_ring,
			johnfacesleep: spr_snicktimer_ring,
			johnfaceback: spr_snicktimer_ring,
			
			bar: spr_snicktimer_bar,
			barfill: spr_snicktimer_fill
		}
	}
	return
	{
		pizzaface1: spr_timer_pizzaface1,
		pizzaface2: spr_timer_pizzaface2,
		pizzaface3: spr_timer_pizzaface3,
		pizzafaceback: spr_timer_pizzafaceback,
		pizzafaceparry: spr_timer_pizzafaceparry,
		pizzafacewait: spr_timer_pizzafacewait,
		tower: spr_timer_tower,
		
		johnface: spr_timer_johnface,
		johnfacesleep: spr_timer_johnfacesleep,
		johnfaceback: spr_timer_johnfaceback,
		
		bar: spr_timer_bar,
		barfill: spr_timer_barfill
	};
}
