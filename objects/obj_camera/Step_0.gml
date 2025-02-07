live_auto_call;
ensure_order;

// visibility
visible = true;
if hud_is_hidden()
	visible = false;

if !global.option_hud
	visible = false;
if instance_exists(obj_endlevelfade)
	visible = false;

// do not process camera
if room == editor_entrance
	exit;

var player = (obj_player1.spotlight == 1) ? obj_player1 : obj_player2;
if !instance_exists(obj_pizzaball)
	targetgolf = noone;

// shaking when collect get
if collect_shake > 0
	collect_shake *= 0.5;

// shake health count
if healthshaketime > 0
{
	healthshaketime--;
	healthshake = random_range(-2, 2);
}
else
	healthshake = 0;

var hp = obj_player1.character == "V" ? global.playerhealth : global.hp;
if healthold != hp
{
	playerhealthup = healthold < hp;
	healthshaketime = 30;
	healthold = hp;
}

// coop player distance (isn't this useless code???)
if global.coop
{
	var p1 = player;
	var p2 = obj_player1.spotlight == 1 ? obj_player2 : obj_player1;
	p2pdistance = point_distance(p1.x, 0, p2.x, 0);
	p2pdistancex = (p1.x >= p2.x ? -p2pdistance : p2pdistance) / 5;
}
else
	p2pdistancex = 0;

// combo ending
if global.hud == HUD_STYLES.april or global.hud == HUD_STYLES.old
	global.comboscore = 0;

if global.combo > 0
{
	comboend = true;
		
	// low combo time, bobs it up and down
	var ct = global.combotime;
	if ct <= 40
	{
		if alarm[5] == -1
		{
			if ct >= 20
				alarm[5] = 12;
			else
				alarm[5] = 5;
		}
	}
	else
		combobubblevisible = true;
}
else if comboend
{
	comboend = false;
	event_perform(ev_alarm, 4);
}

// shoving leftover
if floor(image_index) == 10
	shoving = false;
if shoving && image_index >= 3 && !bang
{
	with instance_create(x, y, obj_fallingHUDface)
	{
		if (obj_player1.spotlight == 0 && obj_player1.character == "P") or (obj_player1.spotlight == 1 && obj_player2.character == "P")
		{
			sprite = spr_pepinoHUDscream;
			hsp = random_range(-1, -5);
		}
		else
		{
			sprite = spr_noiseHUD_panic;
			hsp = random_range(1, 5);
		}
	}
	bang = true;
}
if !shoving
	bang = false;

// old timer
if global.seconds <= 0 && global.minutes <= 0 && !ded
{
	//if !REMIX && !global.snickchallenge
	//	alarm[1] = -1;
	
	if global.miniboss or instance_exists(obj_toppinwarrior)
		alarm[2] = 1;
	else
		alarm[3] = 1;
	ded = true;
}
if global.seconds > 59
{
	global.minutes += 1;
	global.seconds -= 59;
}

// fucking hell
if (!global.panic && !global.snickchallenge) or global.leveltosave == "grinch"
	alarm[1] = 60;

// timed gate
if global.timedgatetimer
{
	if (global.timedgatetime > 0)
		global.timedgatetime--;
	else
	{
		global.timedgatetime = 0;
		global.timedgatetimer = false;
	}
}

// panic screen shake
if !instance_exists(obj_ghostcollectibles) && !REMIX
{
	if ((global.panic == true && global.minutes < 1) or player.sprite_index == player.spr_Timesup)
	{
		shake_mag = 2;
		shake_mag_acc = 3 / room_speed;
	}
	else if (global.panic == true && basement == 0)
	{
		shake_mag = 2;
		shake_mag_acc = 3 / room_speed;
	}
}

// screen shake handle
if shake_mag > 0
{
	shake_mag -= shake_mag_acc;
	if shake_mag < 0
		shake_mag = 0;
}

detachedby = -1;
detach = false;
follow_golf = false;

// follow
var target = followtarget;
if !instance_exists(target)
	target = player;

if instance_exists(target) && !lock && player.state != states.timesup && player.state != states.dead
{
	var scale = 1;
	if target.object_index == obj_player1
		scale = target.col_scale;
	
	if altzoom
	{
		camera_set_view_size(view_camera[0], SCREEN_WIDTH * obj_screensizer.camzoom, SCREEN_HEIGHT * obj_screensizer.camzoom);
		obj_screensizer.camzoom = lerp(obj_screensizer.camzoom, 1, 0.08);
		if obj_screensizer.camzoom >= 0.998
			obj_screensizer.camzoom = 1;
	}
	
	var tx = target.x + offset_x;
	var ty = target.y + offset_y;
	
	if target.object_index == obj_player1 && !MOD.Spotlight
	{
		if REMIX
			tx += target.smoothx;
		if target.state == states.backtohub
			ty = target.backtohubstarty;
		
		// charge cameras
		var old_charge = IT_old_chargecamera();
		if target.state != states.backbreaker && (target.state != states.chainsaw or !REMIX)
		{
			if target.cutscene or (target.collision_flags & colflag.secret > 0)
			{
				if player.state == states.actor && room == tower_pizzafacehall && !instance_exists(obj_startgate)
					chargecamera = Approach(chargecamera, 150, 8);
				else
					chargecamera = Approach(chargecamera, 0, 10);
			}
			else if (!old_charge && target.state == states.mach2) or target.state == states.mach3
			or (old_charge && (target.state == states.tumble or target.state == states.rocket or target.state == states.machroll or target.state == states.rideweenie))
			{
				if (target.state == states.mach3 && target.sprite_index == target.spr_fightball && sign(chargecamera) != target.xscale)
					chargecamera = Approach(chargecamera, 0, 10);
				else
				{
					var _targetcharge = target.xscale * ((target.movespeed / 4) * 50);
					var _tspeed = 0.3;
					
					if old_charge
					{
						_tspeed = 2;
						if target.xscale != sign(chargecamera)
							_tspeed = 8;
					}
					
					chargecamera = Approach(chargecamera, _targetcharge, _tspeed);
				}
			}
			else if target.ratmount_movespeed > 2 && target.key_attack && (target.state == states.ratmount or target.state == states.ratmountjump)
			{
				_targetcharge = target.xscale * ((abs(target.hsp) / 4) * 70);
				_tspeed = 0.3;
				
				if old_charge
				{
					_tspeed = 2;
					if target.xscale != sign(chargecamera)
						_tspeed = 8;
				}
				
				chargecamera = Approach(chargecamera, _targetcharge, _tspeed);
			}
			else if !old_charge
			{
				if (abs(target.hsp) >= 16 or (target.state == states.chainsaw && target.tauntstoredmovespeed >= 16))
				&& player.state != states.climbwall && player.state != states.Sjump && player.state != states.ghost
				{
					_targetcharge = target.xscale * ((abs(target.hsp) / 4) * 50);
					_tspeed = 2;
					if target.xscale != sign(chargecamera)
						_tspeed = 8;
					chargecamera = Approach(chargecamera, _targetcharge, _tspeed);
				}
				else if target.state == states.machslide
					chargecamera = Approach(chargecamera, 0, 10);
				else
					chargecamera = Approach(chargecamera, 0, 6);
			}
			else
				chargecamera = Approach(chargecamera, 0, 2);
		}
			
		// remix specific
		if REMIX
		{
			// clamp chargecamera
			chargecamera = clamp(chargecamera, -320, 320);
			
			// crouch camera
			/*
			if ((player.state == states.crouch or (player.character == "S" && player.state == states.normal)) && player.hsp == 0)
			&& !crouchcamera_goingback && player.key_down
			{
				if crouchcamera < 1
					crouchcamera += 0.02;
				else
					crouchcamera = min(crouchcamera + 3, 150);
			}
			else
			{
				crouchcamera_goingback = true;
				crouchcamera = max(crouchcamera - 5, 0);
			
				if crouchcamera <= 0
					crouchcamera_goingback = false;
			}
			*/
		}
		
		if MOD.GravityJump
			yoffset = Approach(yoffset, !target.gravityjump ? -50 : 0, 2);
		else
			yoffset = Approach(yoffset, IT_camera_yoffset() * (target.gravityjump ? -1 : 1), 3);
	}
	else
	{
		yoffset = IT_camera_yoffset();
		chargecamera = 0;
		crouchcamera = 0;
	}
	
	// prepare camera position
	if !altzoom
	{
		var zoom = camzoom * obj_screensizer.camzoom * scale;
		camera_set_view_size(view_camera[0], SCREEN_WIDTH * zoom, SCREEN_HEIGHT * zoom);
	}
	
	var cam_width = camera_get_view_width(view_camera[0]);
	var cam_height = camera_get_view_height(view_camera[0]);
	
	if !global.coop or room == characterselect or room == rm_levelselect or room == Realtitlescreen
	{
		camx_real = tx - cam_width / 2 + (chargecamera + p2pdistancex) * scale;
		camy_real = ty - cam_height / 2 + ((yoffset * camzoom) * scale);
		
		camx = lerp(camx_real, camx, smooth_buffer * global.smoothcam);
		camy = lerp(camy_real, camy, smooth_buffer * global.smoothcam);
		
		if !safe_get(obj_shell, "WC_oobcam")
		{
			camx = clamp(camx, limitcam[0], limitcam[2] - cam_width);
			camy = clamp(camy, limitcam[1], limitcam[3] - cam_height);
		}
		camera_zoom(1, 0.035);
	}
	/*
	else if obj_player2.state != states.titlescreen
	{
		var cam_x = ((obj_player1.x + obj_player2.x) / 2) - (cam_width / 2);
		var cam_y = ((obj_player1.y + obj_player2.y) / 2) - (cam_height / 2) - 50;
					
		var disx = abs(obj_player1.x - obj_player2.x) / coop_zoom_width;
		var disy = abs(obj_player1.y - obj_player2.y) / coop_zoom_height;
					
		camera_zoom(max(1, disx, disy), 0.035);
	}
	*/
	
	var cam_x = camx, cam_y = camy;
	if shake_mag != 0 && global.option_screenshake
	{
		cam_x += irandom_range(-shake_mag, shake_mag) * scale;
		repeat 2 cam_y += irandom_range(-shake_mag, shake_mag) * scale;
	}
	
	// better panic shake
	if REMIX && PANIC && global.option_screenshake
	{
		cam_x += random_range(-scale, scale);
		repeat 2 cam_y += random_range(-scale, scale);
	}
	
	if !safe_get(obj_shell, "WC_oobcam")
	{
		if cam_width > limitcam[2]
			cam_x += (cam_width - limitcam[2]) / 2;
		if cam_height > limitcam[3]
			cam_y += (cam_height - limitcam[3]) / 2;
	}
	
	// snick spindash lag
	var camx_final = cam_x;
	if lag == 0
	{
		if lagpos == undefined
			lagpos = camera_get_view_x(view_camera[0]) - cam_x;
		else
		{
			lagpos = Approach(lagpos, 0, 25);
			if lagpos == 0
				lag = -1;
		}
		camx_final += lagpos;
	}
	else if lag > 0
	{
		lagpos = undefined;
		lag--;
		
		camx_final = CAMX;
	}
	
	// stored camera pos
	lockx = cam_x;
	locky = cam_y;
	
	// finally set the camera position
	if scale >= 1
	{
		camx_final = round(camx_final);
		cam_y = round(cam_y);
	}
	camera_set_view_pos(view_camera[0], camx_final, cam_y);
	
	offset_x = Approach(offset_x, 0, offset_speed);
	offset_y = Approach(offset_y, 0, offset_speed);
}
else if REMIX && room != rank_room && room != timesuproom && !instance_exists(obj_bosscontroller)
{
	var cam_x = lockx, cam_y = locky;
	if shake_mag != 0 && global.option_screenshake
	{
		cam_x += irandom_range(-shake_mag, shake_mag);
		repeat 2
			cam_y += irandom_range(-shake_mag, shake_mag);
	}
	
	// better panic shake
	if PANIC && global.option_screenshake
	{
		cam_x += random_range(-1, 1);
		repeat 2 cam_y += random_range(-1, 1);
	}
	camera_set_view_pos(view_camera[0], round(cam_x), round(cam_y));
}
smooth_buffer = 1;

// update wave
if global.panic or global.snickchallenge
{
	global.wave = global.maxwave - global.fill;
	if true//SUGARY_SPIRE && check_sugary()
	{
		if !lock
		{
			if global.leveltosave != "sucrose" && !instance_exists(obj_ghostcollectibles)
			{
				var range = 30 * clamp(global.wave / global.maxwave, 0, 1);
				var time = 30 - (5 * clamp(global.wave / global.maxwave, 0, 1));
				panicangle = sin(scr_current_time() / (time * 100)) * range;
			}
			else
				panicangle = 0;
		}
		
		if instance_exists(obj_pizzaface) && !MOD.DeathMode
			greyscale = Approach(greyscale, 0.45, 0.005);
		else
			greyscale = Approach(greyscale, 0, 0.01);
	}
	else
	{
		panicangle = 0;
		greyscale = 0;
	}
}
else if !instance_exists(obj_endlevelfade)
{
	panicangle = 0;
	greyscale = 0;
}
else
{
	panicangle = Approach(panicangle, 0, 15);
	greyscale = Approach(greyscale, 0, 0.01);
}
camera_set_view_angle(view_camera[0], angle + panicangle);
