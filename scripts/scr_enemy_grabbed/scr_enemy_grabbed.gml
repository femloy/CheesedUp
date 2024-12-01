function scr_enemy_grabbed()
{
	if (!pepperman_grab)
	{
		var _obj_player = obj_player1;
		image_xscale = -_obj_player.xscale;
		stunned = 200;
		
		_obj_player.baddiegrabbedID = id;
		if (_obj_player.state == states.grabbing || _obj_player.state == states.grab || _obj_player.state == states.throwing || _obj_player.state == states.slam || _obj_player.state == states.tacklecharge)
			scr_enemy_grabpos(_obj_player);
		
		with (_obj_player)
		{
			suplexhavetomash = other.hp - 1;
			move = key_left2 + key_right2;
			if (!(state == states.grab || state == states.chainsaw || state == states.pummel || state == states.finishingblow || state == states.grabbing || state == states.throwing || state == states.slam || state == states.tacklecharge || state == states.punch || state == states.superslam || state == states.backkick || state == states.uppunch || state == states.shoulder))
			{
				other.x = x;
				other.y = y;
				with other
					check_grabbed_solid(_obj_player);
				other.state = states.stun;
				other.image_index = 0;
			}
		}
		
		hsp = 0;
		if (_obj_player.state == states.punch || _obj_player.state == states.parry)
		{
			alarm[3] = 3;
			global.hit += 1;
			if (other.object_index == obj_pizzaball)
				global.golfhit += 1;
			instance_create(x + (_obj_player.xscale * 30), y, obj_bumpeffect);
			alarm[1] = 5;
			thrown = true;
			x = _obj_player.x;
			vsp = 0;
			y = _obj_player.y;
			state = states.stun;
			hsp = -image_xscale * 25;
			grav = 0;
			if (object_index != obj_swapplayergrabbable)
				global.combotime = 60;
			if (!important)
				global.style += 5 + floor(global.combo / heat_nerf);
			create_slapstar(x, y);
			create_baddiegibs(x, y);
			flash = true;
			shake_camera(3, 3 / room_speed);
		}
		if (_obj_player.state == states.finishingblow)
		{
			if (floor(_obj_player.image_index) < 1 && _obj_player.sprite_index == _obj_player.spr_swingdingend)
			{
				x = _obj_player.x + (_obj_player.xscale * 60);
				y = _obj_player.y;
			}
			else if (floor(_obj_player.image_index) < 4)
			{
				x = _obj_player.x + (_obj_player.xscale * 60);
				y = _obj_player.y;
			}
			check_grabbed_solid(_obj_player);
		}
		if (_obj_player.state == states.backkick)
		{
			alarm[3] = 3;
			global.hit += 1;
			if (other.object_index == obj_pizzaball)
				global.golfhit += 1;
			hp -= 1;
			instance_create(x + (-_obj_player.xscale * 50), y, obj_bumpeffect);
			alarm[1] = 5;
			thrown = true;
			x = _obj_player.x;
			y = _obj_player.y;
			state = states.stun;
			image_xscale *= -1;
			hsp = -image_xscale * 20;
			vsp = -7;
			if (object_index != obj_swapplayergrabbable)
				global.combotime = 60;
			if (!important)
				global.style += 5 + floor(global.combo / heat_nerf);
			create_slapstar(x, y);
			create_baddiegibs(x, y);
			flash = true;
			shake_camera(3, 3 / room_speed);
		}
		if (_obj_player.state == states.shoulder)
		{
			alarm[3] = 3;
			global.hit += 1;
			if (other.object_index == obj_pizzaball)
				global.golfhit += 1;
			hp -= 1;
			instance_create(x, y + 20, obj_bumpeffect);
			alarm[1] = 5;
			thrown = true;
			x = _obj_player.x;
			y = _obj_player.y;
			state = states.stun;
			if (_obj_player.sprite_index == spr_player_shoulder)
				vsp = 15;
			if (_obj_player.sprite_index == spr_player_diagonaldownthrow)
			{
				hsp = -image_xscale * 10;
				vsp = 15;
			}
			if (_obj_player.sprite_index == spr_player_diagonalupthrow)
			{
				hsp = -image_xscale * 10;
				vsp = -15;
			}
			if (object_index != obj_swapplayergrabbable)
				global.combotime = 60;
			if (!important)
				global.style += 5 + floor(global.combo / heat_nerf);
			create_slapstar(x, y);
			create_baddiegibs(x, y);
			flash = true;
			shake_camera(3, 3 / room_speed);
		}
		if (_obj_player.state == states.finishingblow && ((floor(_obj_player.image_index) >= (IT_FINAL ? 4 : 5)) || (floor(_obj_player.image_index) < 1 && _obj_player.sprite_index == _obj_player.spr_swingdingend)))
		{
			thrown = true
			if heavy
				var lag = 15
			else
				lag = 5
			
			// lag isn't actually used here. the states aren't set
			hitLag = lag
			hitX = x
			hitY = y
			
			_obj_player.movespeed = 0
			_obj_player.hitLag = lag
			_obj_player.hitX = _obj_player.x
			_obj_player.hitY = _obj_player.y
			
			instance_create(x, y, obj_parryeffect)
			alarm[3] = 1
			
			if (object_index != obj_swapplayergrabbable)
				global.combotime = 60
			global.heattime = 60
			if (!important)
				global.style += 5 + floor(global.combo / heat_nerf)
			
			GamepadSetVibration(_obj_player.object_index == obj_player1 ? 0 : 1, 0.8, 0.8, 0.65)
			sound_play_3d("event:/sfx/enemies/killingblow", x, y)
			sound_play_3d("event:/sfx/pep/punch", x, y)
			
			state = states.stun
			image_xscale = -_obj_player.xscale
			
			repeat 3
			{
				create_slapstar(x, y)
				create_baddiegibs(x, y)
			}
			shake_camera(3, 3 / room_speed);
			
			with _obj_player
			{
				if sprite_index == spr_uppercutfinishingblow
				{
					other.hithsp = 0
					other.hitvsp = -25
					other.linethrown = true
				}
				else
				{
					other.hithsp = (-other.image_xscale) * 25
					other.hitvsp = -8
					other.linethrown = true
				}
				vsp = -6
			}
			if (_obj_player.sprite_index != spr_playerN_piledriver)
				check_grabbed_solid(_obj_player)
			hsp = hithsp
			vsp = hitvsp
			linethrown = true
		}
		if (_obj_player.state == states.throwing)
		{
			global.hit += 1;
			if (other.object_index == obj_pizzaball)
				global.golfhit += 1;
			alarm[1] = 5;
			thrown = true;
			x = _obj_player.x;
			y = _obj_player.y;
			state = states.stun;
			hsp = -image_xscale * 8;
			vsp = -6;
			check_grabbed_solid(_obj_player);
		}
		if (_obj_player.state == states.uppunch)
		{
			alarm[3] = 3;
			global.hit += 1;
			if (other.object_index == obj_pizzaball)
				global.golfhit += 1;
			hp -= 1;
			instance_create(x + (-_obj_player.xscale * 15), y - 50, obj_bumpeffect);
			alarm[1] = 5;
			thrown = true;
			x = _obj_player.x;
			y = _obj_player.y;
			hsp = -image_xscale * 2;
			state = states.stun;
			vsp = -20;
			if (object_index != obj_swapplayergrabbable)
				global.combotime = 60;
			if (!important)
				global.style += 5 + floor(global.combo / heat_nerf);
			create_slapstar(x, y);
			create_baddiegibs(x, y);
			flash = true;
			shake_camera(3, 3 / room_speed);
			check_grabbed_solid(_obj_player);
		}
		if (_obj_player.state == states.tacklecharge)
		{
			x = _obj_player.x + (_obj_player.xscale * 15);
			y = _obj_player.y;
		}
		if (_obj_player.state == states.superslam || (_obj_player.state == states.chainsaw && sprite_index == spr_player_piledriver))
			scr_enemy_grabpos(_obj_player);
		if (_obj_player.sprite_index == _obj_player.spr_piledriverland && floor(_obj_player.image_index) == (_obj_player.image_number - 1))
		{
			instance_create(_obj_player.x, _obj_player.y, obj_parryeffect);
			check_grabbed_solid(_obj_player);
			
			if (!elite || elitehit <= 0)
				mach3destroy = true;
			if (!important)
				global.style += 5 + floor(global.combo / heat_nerf);
			
			image_xscale = -_obj_player.xscale;
			repeat 3
			{
				create_slapstar(x, y);
				create_baddiegibs(x, y);
			}
			shake_camera(3, 3 / room_speed);
			
			var lag = 5;
			with (_obj_player)
			{
				scr_hitstun_player(lag);
				other.hsp = -other.image_xscale * 8;
				other.vsp = -11;
			}
			scr_hitstun_enemy(id, lag);
		}
		if (_obj_player.state == states.grab && _obj_player.sprite_index == _obj_player.spr_swingding)
			scr_enemy_grabpos(_obj_player);
		if (state != states.grabbed || _obj_player.state != states.grab)
		{
			check_grabbed_solid(_obj_player);
			if (state == states.hit)
			{
				hitX = x;
				hitY = y;
			}
		}
	}
	if (pepperman_grab)
	{
		var _player = (grabbedby == 1) ? obj_player1.id : obj_player2.id;
		image_xscale = _player.xscale;
		if (!thrown)
		{
			x = _player.x;
			y = _player.y - 60;
		}
		if (_player.key_attack && !_player.key_up)
		{
			alarm[1] = 5;
			thrown = true;
			x = _player.x;
			y = _player.y - 10;
			state = states.stun;
			hsp = image_xscale * 30;
			vsp = -6;
			_player.sprite_index = spr_pepperman_throw;
			_player.image_index = 0;
			_player.pepperman_grabID = noone;
		}
		if (_player.key_attack && _player.key_up)
		{
			alarm[1] = 5;
			thrown = true;
			x = _player.x;
			y = _player.y - 10;
			check_grabbed_solid(_player);
			state = states.stun;
			hsp = image_xscale * 2;
			vsp = -20;
			_player.sprite_index = spr_pepperman_throw;
			_player.image_index = 0;
			_player.pepperman_grabID = noone;
		}
		if (_player.state != states.normal && _player.state != states.jump)
		{
			_player.pepperman_grabID = noone;
			state = states.stun;
			pepperman_grab = false;
		}
	}
	sprite_index = stunfallspr;
	image_speed = 0.35;
}
function check_grabbed_solid(player)
{
	if (instakilled && destroyable)
		exit;
	if (instance_exists(player) && player.sprite_index == spr_playerN_piledriver)
		exit;
	
	var strict = !destroyable;
	if (!place_meeting(x, y, obj_destructibles) && (scr_solid(x, y) || collision_line(x, y, player.x, player.y, obj_solid, false, true) != noone))
	{
		var _dist = abs(x - obj_player.x);
		
		x = player.x;
		y = player.y;
		if !scr_solid(x + player.xscale, y) or strict
		{
			var i = 0;
			while (!scr_solid(x + player.xscale, y))
			{
				x += player.xscale;
				i++;
				if (i > _dist)
					break;
			}
			if (scr_solid(x, y))
			{
				i = 0;
				while (scr_solid(x, y))
				{
					x -= player.xscale;
					i++;
					if (i > _dist)
						break;
				}
			}
		}
	}
}
