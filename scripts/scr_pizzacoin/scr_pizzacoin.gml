global.pizzacoin = 0;
global.pizzacoin_earned = 0;

#macro USE_PIZZACOIN (!global.sandbox && !instance_exists(obj_cyop_loader) && scr_postgame())

function scr_pizzacoin_result()
{
	var pizzacoin = 0;
	
	if !USE_PIZZACOIN
		return 0;
	if global.tutorial_room
		return 0;
	
	switch global.rank
	{
		case "d": pizzacoin = global.level_minutes >= 2 ? 5 : 0; break;
		// 5 pizzacoins if spent at least 2 minutes in the level, otherwise 0
		
		case "c": pizzacoin = 1; break;
		case "b": pizzacoin = 2; break;
		case "a": pizzacoin = 3; break;
		case "s": pizzacoin = 4; break;
		case "p": pizzacoin = 5; break;
	}
	
	if global.secretfound >= scr_secretcount(global.leveltosave)
		pizzacoin += 1;
	if global.treasure
		pizzacoin += 1;
	
	if check_lap_mode(LAP_MODES.infinite)
	{
		pizzacoin += ceil(min(global.laps, 100) / 5);
		// 1 pizzacoin every 5 laps, stops at 100
	}
	else if check_lap_mode(LAP_MODES.april) && global.treasure
		pizzacoin += 3;
	else
	{
		if global.lap
			pizzacoin += 1;
		if check_lap_mode(LAP_MODES.laphell) && global.laps >= 2
		{
			if !global.parrypizzaface
				pizzacoin += 1;
			if !global.lap3checkpoint
				pizzacoin += 3;
			pizzacoin += 5;
		}
	}
	
	if MOD.GreenDemon
		pizzacoin *= 1.75;
	if MOD.CosmicClones
		pizzacoin *= 1.5;
	if MOD.Spotlight
		pizzacoin *= 1.25;
	if MOD.NoiseWorld
		pizzacoin *= 1.25;
	if MOD.GravityJump
		pizzacoin *= 1.25;
	if MOD.HardMode
		pizzacoin *= 0.75;
	
	if (global.rank == "s" or global.rank == "p") && global.hurtcounter == 0
		pizzacoin += 2;
	
	return floor(pizzacoin);
}
