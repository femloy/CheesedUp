function textures_offload(texturegroup_array)
{
	var b = instance_create(0, 0, obj_loadingscreen);
	with (b)
	{
		group_arr = texturegroup_array;
		if global.offload_tex != noone && !global.in_cyop
		{
			offload_arr = array_create(0);
			array_copy(offload_arr, 0, global.offload_tex, 0, array_length(global.offload_tex));
			global.offload_tex = noone;
		}
	}
	return b;
}
function scr_playerreset(roomstart = false, restart = false)
{
	//if live_call(roomstart, restart) return live_result;
	
	trace("[Player Reset] roomstart: ", roomstart, ", restart: ", restart, ", room: ", room_get_name(room));
	
	// eased up
	var from_checkpoint = is_struct(global.checkpoint_data) && global.checkpoint_data.loaded == 2;
	if !roomstart && !restart
	{
		reset_modifier();
		global.snickchallenge = false;
		global.timeattack = false;
		scr_save_attempts();
	}
	if global.snickchallenge
	{
		global.snickchallenge = false;
		activate_snickchallenge();
	}
	with obj_deathmode
		active = false;
	with obj_parallax
		sucrose_state = 0;
	
	global.modifier_failed = false;
	global.vigiweapon = vweapons.dynamite;
	
	global.lap4time = 1;
	if !from_checkpoint
	{
		clear_checkpoint();
		with obj_roomname
			ds_list_clear(seen_rooms);
	}
	if !roomstart
	{
		instance_destroy(obj_greendemon);
		with obj_player1
		{
			if state != states.dead
				instance_destroy(obj_genericdeath);
		}
	}
	
	global.can_timeattack = true;
	global.tatime = 0;
	
	// pt reset
	global.lap = false;
	if (room != boss_pizzaface && room != boss_noise && room != boss_pepperman && room != boss_fakepep && room != boss_vigilante)
		global.bossintro = false;
	global.bossplayerhurt = false;
	global.swap_boss_damage = 0;
	global.playerhit = 0;
	global.laps = 0;
	global.secretfound = 0;
	global.combo = 0;
	global.highest_combo = 0;
	global.player_damage = 0;
	global.swap_damage[0] = 0;
	global.swap_damage[1] = 0;
	global.peppino_damage = 0;
	global.gustavo_damage = 0;
	global.comboscore = 0;
	global.enemykilled = 0;
	global.tauntcount = 0;
	global.prank_enemykilled = false;
	global.prank_cankillenemy = true;
	global.noisejetpack = false;
	with (obj_player)
		noisepizzapepper = false;
	global.level_minutes = 0;
	global.level_seconds = 0;
	global.pistol = false;
	
	with (obj_screensizer)
		camzoom = 1;
	with obj_camera
	{
		camzoom = 1;
		lock = false;
		state = states.normal;
		lag = -1;
		lagpos = 0;
	}
	
	with (obj_swapmodefollow)
	{
		isgustavo = false;
		get_character_spr();
	}
	
	with (obj_achievementtracker)
	{
		achievement_reset_variables(achievements_notify);
		achievement_reset_variables(achievements_update);
	}
	
	if !roomstart
	{
		with obj_music
		{
			panicstart = false;
			secretend = true;
			secret = false;
		}
		stop_music();
	}
	fmod_set_parameter("musicmuffle", 0, false);
	fmod_set_parameter("pillarfade", 0, true);
	
	camera_set_view_size(view_camera[0], SCREEN_WIDTH, SCREEN_HEIGHT);
	
	instance_destroy(obj_frontcanongoblin);
	instance_destroy(obj_pumpkineffect);
	instance_destroy(obj_pumpkincounter);
	instance_destroy(obj_transfotip);
	instance_destroy(obj_flushcount);
	if !roomstart
		instance_destroy(obj_fadeout);
	instance_destroy(obj_comboend);
	instance_destroy(obj_combotitle);
	instance_destroy(obj_confettieffect);
	instance_destroy(obj_pizzaball_rank);
	instance_destroy(obj_pizzaball_golfhit);
	instance_destroy(obj_combotitle);
	instance_destroy(obj_comboend);
	if !from_checkpoint
		instance_destroy(obj_sandparticle);
	instance_destroy(obj_lap2visual);
	instance_destroy(obj_keyfollow);
	instance_destroy(obj_hpeffect);
	instance_destroy(obj_crosspriest_cross);
	instance_destroy(obj_hardmode_ghost);
	instance_destroy(obj_gravecorpse, false);
	
	with obj_camera
	{
		alarm[4] = -1;
		comboend = false;
		previousrank = 0;
	}
	
	if !global.levelreset
	{
		if !from_checkpoint
		{
			instance_destroy(obj_surfback);
			instance_destroy(obj_snowparticle);
		}
		
		instance_destroy(obj_randomsecret);
		instance_destroy(obj_deliverytimer);
		instance_destroy(obj_wartimer);
		instance_destroy(obj_cutscene_handler);
		instance_destroy(obj_endlevelfade);
		instance_destroy(obj_monstertrackingrooms);
		instance_destroy(obj_trapghost);
		instance_destroy(obj_comboend);
		instance_destroy(obj_farmer1follow);
		instance_destroy(obj_farmer2follow);
		instance_destroy(obj_farmer3follow);
		instance_destroy(obj_snickexe);
		instance_destroy(obj_snickexf);
		instance_destroy(obj_snickexg);
		instance_destroy(obj_snickexh);
		instance_destroy(obj_pizzaface, false)
		instance_destroy(obj_pizzashield);
		instance_destroy(obj_pepanimatronicfollow);
		instance_destroy(obj_coopflag);
		instance_destroy(obj_cooppointer);
		instance_destroy(obj_coopplayerfollow);
		instance_destroy(obj_toppinwarrior);
		instance_destroy(obj_timesup);
		
		with obj_camera
			alarm[4] = -1;
		with (obj_tv)
		{
			event_perform(ev_alarm, 0);
			shownrankp = false;
			shownranks = false;
			shownranka = false;
			shownrankb = false;
			shownrankc = false;
			
			ds_list_clear(tvprompts_list);
			prompt = "";
			bubblespr = noone;
			promptx = promptxstart;
			tv_bg_index = 0;
			expressionsprite = -4;
			
			sprite_index = spr_tv_off;
			tvsprite = spr_tv_idle;
			targetspr_old = -1;
			state = states.normal;
			tv_set_idle();
		}
		with (obj_secretmanager)
		{
			ds_list_clear(secrettriggers);
			ds_list_clear(touchall);
			touchrequirement = noone;
			init = false;
		}
		ds_list_clear(global.baddieroom);
		ds_list_clear(global.saveroom);
		ds_list_clear(global.escaperoom);
		global.combodropped = false;
		global.timeractive = false;
		global.wave = 0;
		global.maxwave = 0;
		global.secretfound = 0;
		global.hurtcounter = 0;
		global.giantkey = false;
		global.pizzadelivery = false;
		global.failcutscene = false;
		global.pizzasdelivered = 0;
		global.spaceblockswitch = true;
		global.fill = 500;
		global.chunk = 5;
		global.hasfarmer = array_create(3, false);
		global.checkpoint_room = noone;
		global.checkpoint_door = "A";
		global.noisejetpack = false;
		global.hp = 0;
		global.kungfu = false;
		global.graffiticount = 0;
		global.gerome = false;
		global.stylelock = false;
		global.ammorefill = 0;
		global.ammoalt = 1;
		global.mort = false;
		global.style = 0;
		global.spaceblockswitch = true;
		global.stylethreshold = 0;
		global.baddiespeed = 1;
		global.bullet = 3;
		global.fuel = 3;
		global.horse = false;
		global.golfhit = 0;
		global.railspeed = global.maxrailspeed;
		global.temperature = 0;
		if (room != freezer_1)
			global.use_temperature = false;
		global.heatmeter_count = 0;
		global.monsterspeed = 0;
		global.timedgate = false;
		global.timedgatetimer = false;
		global.timedgateid = noone;
		global.timedgatetime = 0;
		global.key_inv = false;
		global.pepanimatronic = false;
		global.shroomfollow = false;
		global.cheesefollow = false;
		global.tomatofollow = false;
		global.sausagefollow = false;
		global.pineapplefollow = false;
		global.keyget = false;
		global.collect = 0;
		global.lastcollect = 0;
		global.collectN = 0;
		global.collect_player[0] = 0;
		global.collect_player[1] = 0;
		global.hats = 0;
		global.extrahats = 0;
		global.ammo = 0;
		global.treasure = false;
		global.combo = 0;
		global.combotime = 0;
		global.heattime = 0;
		global.pizzacoin = 0;
		global.toppintotal = 1;
		global.hit = 0;
		global.playerhealth = 100;
		global.panic = false;
		with (obj_stylebar)
			sprite = spr_mild;
		with (obj_music)
			arena = false;
	}
	with (obj_player)
	{
		mort = false;
		noisepizzapepper = false;
		goblinkey = false;
		transformationsnd = false;
		player_destroy_sounds();
		player_init_sounds();
		image_alpha = 1;
		hallway = false;
		verticalhallway = false;
		tauntstoredstate = states.normal;
		ratpowerup = noone;
		scale_xs = 1;
		scale_ys = 1;
		holycross = 0;
		ghostdash = false;
		ghostdashbuffer = 0;
		ghostpepper = 0;
		ghosteffect = 0;
		ghostbump = 1;
		ghostbumpbuffer = -1;
		with obj_camera
			targetgolf = noone;
		if variable_global_exists("baddietomb")
			ds_list_clear(global.baddietomb);
		supercharge = 0;
		supercharged = false;
		pistol = false;
		instance_destroy(obj_gnome_checklist);
		spotlight = true;
		global.SAGEshotgunsnicknumber = 0;
		with obj_music
			fadeoff = 0;
		audio_stop_all();
		global.seconds = 59;
		global.minutes = 1;
		prevstate = states.comingoutdoor;
		state = states.comingoutdoor;
		visible = true;
		ds_list_clear(global.saveroom);
		ds_list_clear(global.escaperoom);
		ds_list_clear(global.baddieroom);
		
		flash = false;
		pistolcharge = 0;
		pistolchargedelay = 5;
		pistolchargeshooting = false;
		pistolchargeshot = 8;
		ds_list_clear(hitlist);
		pistolanim = noone;
		image_blend = make_colour_hsv(0, 0, 255);
		boxxed = false;
		boxxeddash = false;
		supercharged = false;
		pizzapepper = 0;
		pizzashield = false;
		c = 0;
		heavy = false;
		image_index = 0;
		sprite_index = spr_walkfront;
		alarm[0] = -1;
		alarm[1] = -1;
		alarm[3] = -1;
		alarm[4] = -1;
		alarm[5] = -1;
		alarm[6] = -1;
		alarm[7] = -1;
		alarm[8] = -1;
		alarm[9] = -1;
		alarm[10] = -1;
		grav = 0.5;
		hsp = 0;
		vsp = 0;
		xscale = 1;
		yscale = 1;
		parry = false;
		parry_inst = noone;
		parry_count = 0;
		is_firing = false;
		pogospeed = 6;
		pogochargeactive = false;
		pogocharge = 100;
		x = backtohubstartx;
		y = backtohubstarty;
		roomstartx = x;
		roomstarty = y;
		backupweapon = false;
		shotgunAnim = false;
		box = false;
		steppy = false;
		movespeedmax = 5;
		jumpstop = false;
		start_running = true;
		with obj_camera
			ded = false;
		visible = true;
		turn = false;
		jumpAnim = true;
		dashAnim = true;
		landAnim = false;
		machslideAnim = false;
		moveAnim = true;
		stopAnim = true;
		crouchslideAnim = true;
		crouchAnim = true;
		machhitAnim = false;
		stompAnim = false;
		inv_frames = false;
		turning = false;
		hurtbounce = 0;
		hurted = false;
		autodash = false;
		mach2 = 0;
		input_buffer_jump = 0;
		input_buffer_secondjump = 8;
		input_buffer_highjump = 8;
		flash = false;
		in_water = false;
		key_particles = false;
		barrel = false;
		bounce = false;
		a = 0;
		idle = 0;
		attacking = false;
		slamming = false;
		superslam = 0;
		machpunchAnim = false;
		punch = false;
		machfreefall = 0;
		shoot = false;
		instakillmove = false;
		windingAnim = 0;
		facestompAnim = false;
		ladderbuffer = 0;
		chainsaw = 50;
		toomuchalarm1 = 0;
		toomuchalarm2 = 0;
		dashdust = false;
		throwforce = 0;
		hurtsound = false;
		idleanim = 0;
		momemtum = false;
		cutscene = false;
		grabbing = false;
		dir = xscale;
		goingdownslope = false;
		goingupslope = false;
		fallinganimation = 0;
		bombpeptimer = 100;
		slapbuffer = 0;
		slaphand = 1;
		suplexmove = false;
		suplexhavetomash = 0;
		timeuntilhpback = 300;
		anger = 0;
		angry = false;
		skateboarding = false;
		
		if character != "G"
		{
			brick = false;
			isgustavo = false;
		}
		else
		{
			brick = true;
			isgustavo = true;
		}
		player_destroy_sounds();
		player_init_sounds();
		
		noisecrusher = false;
		tauntstoredisgustavo = false;
		controllableSjump = false;
		noisebossscream = false;
		scale_xs = 1;
		scale_ys = 1;
		secretportalID = noone;
		
		// pto
		smoothx = 0;
		oldHallway = false;
		keydoor = false;
		pistol = false;
		jetpackcancel = false;
		suplexmove2 = false;
		breakout = 0;
		shaketime = 0;
		superjumped = false;
		image_blend_func = noone;
		substate = states.normal;
		gravityjump = false;
		flip = 1;
		ceilingrun = false;
		burning = 0;
		exitgate_room = noone;
	}
	with obj_followcharacter
	{
		if persistent && object_index != obj_swapmodefollow
			instance_destroy();
	}
	instance_destroy(obj_shotgunback);
	
	if global.timeattack
		scr_level_gimmicks_persist();
	
	scr_modding_hook("player/reset", [roomstart, restart]);
}
