function scr_debugdraw()
{
	live_auto_call;
	
	draw_set_font(lfnt("font_small"));
	draw_set_align();
	draw_set_color(c_white);
	
	var str = "";
	
	if !global.timeattack
	{
		// score
		str = $"Score: {global.collect}\n";
	
		// rank
		var rank = "D";
		if global.collect >= global.srank
			rank = scr_is_p_rank() ? "P" : "S";
		else if global.collect >= global.arank
			rank = "A";
		else if global.collect >= global.brank
			rank = "B";
		else if global.collect >= global.crank
			rank = "C";
		str += $"Rank: {rank}\n";
	}
	else
	{
		// time
		var seconds = floor(global.tatime / 60);
		var minutes = floor(seconds / 60);
		seconds = seconds % 60;
		
		str = $"Time: {minutes}:{seconds < 10 ? concat("0", seconds) : seconds}\n";
		
		// rank
		var rank = "D", next = noone;
		if global.tatime <= global.tasrank
		{
			rank = scr_is_p_rank() ? "P" : "S";
			next = global.tasrank;
		}
		else if global.tatime <= global.taarank
		{
			rank = "A";
			next = global.taarank;
		}
		else if global.tatime <= global.tabrank
		{
			rank = "B";
			next = global.tabrank;
		}
		else if global.tatime <= global.tacrank
		{
			rank = "C";
			next = global.tacrank;
		}
		
		if next == noone
			str += $"Rank: {rank}\n";
		else
		{
			var seconds = floor(next / 60);
			var minutes = floor(seconds / 60);
			seconds = seconds % 60;
			
			str += $"Rank: {rank} until {minutes}:{seconds < 10 ? concat("0", seconds) : seconds}\n";
		}
	}
	
	// heat meter
	if global.heatmeter
	{
		str += $"Heat: {floor(global.stylemultiplier * 100)}%\n";
		str += $"Heat level: {global.stylethreshold}\n";
	}
	
	// combo
	str += $"Combo: {global.combo}\n";
	str += $"Combo time: {floor(global.combotime)}\n";
	
	// time
	if (global.panic or global.snickchallenge) && !global.timeattack
	{
		var time = scr_filltotime();
		str += $"Time remaining: {time[0]}:{time[1] < 10 ? concat("0", time[1]) : time[1]}\n";
		if global.panic
			str += $"Lap {global.laps + 1}\n";
	}
	
	// draw it
	draw_text(8, 8, str);
}
