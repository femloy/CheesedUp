function scr_enemy_hit()
{
	x = hitX + random_range(-6, 6);
	y = hitY + random_range(-6, 6);
	hitLag--;
	sprite_index = stunfallspr;
	
	if check_boss(object_index)
	{
		if player_instakillmove && pizzahead && object_index != obj_gustavograbbable
		{
			obj_player1.baddiegrabbedID = id;
			scr_boss_grabbed();
			exit;
		}
	}
	
	if hitLag <= 0
	{
		x = hitX;
		y = hitY;
		
		var _player = obj_player1.id;
		var _state = _player.state;
		
		if _state == states.chainsaw
			_state = _player.tauntstoredstate;
		
		if !IT_baddie_mach2kill()
		{
			if check_boss(object_index) && override_throw
			{
				thrown = true;
				override_throw = false;
			}
			else if _state == states.mach2 or _state == states.tumble or (_state == states.machslide && _player.sprite_index != _player.spr_mach3boost && _player.sprite_index != _player.spr_mach3boostfall) or sprite_index == _player.spr_ratmount_attack or sprite_index == _player.spr_lonegustavodash or hit_connected
				thrown = false;
			else if !(SUGARY_SPIRE && object_index == obj_bigcherry) && !(BO_NOISE && object_index == obj_twoliterdog)
				thrown = true;
		}
		else
		{
			thrown = true;
			override_throw = false;
		}
		
		vsp = hitvsp;
		hsp = hithsp;
		
		/*
		if vsp < 0
			grounded = false;
		*/
		
		global.hit += 1;
		if other.object_index == obj_pizzaball
			global.golfhit += 1;
		
		if thrown
			global.combotime = 60;
		
		global.heattime = 60;
		alarm[1] = 5;
		
		var _hp = -1;
		if shoulderbashed or !IT_baddie_mach3destroy()
		{
			_hp = -7;
			mach3destroy = false;
		}
		
		if ((!elite && (hp <= _hp or mach3destroy)) or (elite && (elitehit <= 0 or mach3destroy))) && object_get_parent(object_index) != par_boss && object_index != obj_pizzafaceboss && destroyable && !mach2
		{
			instance_destroy();
			create_particle(x, y, part.genericpoofeffect);
		}
		
		stunned = 200;
		state = states.stun;
		
		if check_boss(object_index)
		{
			if _player.tauntstoredstate != states.punch && _player.tauntstoredstate != states.freefall && _player.tauntstoredstate != states.superslam
			{
				linethrown = true;
				grounded = false; // fixes a bug
				
				var f = 15;
				if _player.tauntstoredstate == states.mach3
					f = 25;
				
				if abs(hithsp) > abs(hitvsp)
				{
					if abs(hithsp) < f
						hithsp = sign(hithsp) * f;
				}
				else if abs(hitvsp) < f
					hitvsp = sign(hitvsp) * f;
			}
			else if !pizzahead
			{
				hithsp = 22 * -image_xscale;
				hitvsp = -7;
				hsp = hithsp;
				vsp = hitvsp;
				flash = false;
				state = states.stun;
				thrown = true;
				linethrown = false;
			}
			
			if _state == states.mach2 or _state == states.tumble
				stunned *= 5;
		}
		if mach2
			thrown = false;
		mach2 = false;
	}
}
