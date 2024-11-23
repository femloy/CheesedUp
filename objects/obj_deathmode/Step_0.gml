live_auto_call;

if DEATH_MODE
{
	if !MOD.DeathMode
		active = false;
	if global.lapmode == lapmodes.laphell && global.laps >= 2
		active = false;
	if global.modifier_failed
		active = false;
	
	if !active or room == rank_room or room == timesuproom
		exit;
	
	var stop = false;
	with obj_player
	{
		if state == states.taxi || state == states.victory || state == states.keyget || state == states.gottreasure || state == states.door || state == states.spaceshuttle
			stop = true;
	}

	if show_time > 0
	    show_time--;
	else if time > 0
	{
		if !stop
			time--;
	
		var exists = false;
		with obj_pizzaface
		{
			if mode > -1
				exists = true;
		}
		if !exists
			instance_create(obj_player1.x, obj_player1.y, obj_pizzaface);
	}

	// disable p rank
	if time <= 0
	{
		time = 0;
		global.prank_cankillenemy = false;
	    global.prank_enemykilled = false;
	}

	if time_fx_y > 0
		time_fx_y--;
	ybump = lerp(ybump, 0, 0.5);

	if time_fx > 0
	{
		var spd = max((time_fx / 10) * 0.25, 0.2);
		time += 60 * spd;
		time_fx -= spd;
		time_fx_y = 15;
	
		if frac(time_fx) == 0
			ybump = -4;
		if check_char(["G", "V"])
			time += 15 * spd;
	}

	var tgt_y = 0;
	if show_time > 0
	    tgt_y = 60;

	surfy = Approach(surfy, tgt_y, 3);
	surfscale = (surfy / 100) * 0.5;
}
