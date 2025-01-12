global.player_started = false;

function scr_player_startup()
{
	if global.player_started
		exit;
	global.player_started = true;
	
	global.leveltosave = noone;
	global.leveltorestart = noone;
	global.offload_tex = noone;
	
	global.saveroom = ds_list_create();
	global.escaperoom = ds_list_create();
	global.instancelist = ds_list_create();
	global.followerlist = ds_list_create();
	global.baddieroom = ds_list_create();
	
	global.combodropped = false;
	global.lap = false;
	global.laps = 0;
	global.playerhealth = 100;
	global.maxrailspeed = 2;
	global.railspeed = global.maxrailspeed;
	global.levelreset = false;
	global.temperature = 0;
	global.temperature_spd = 0.01;
	global.temp_thresholdnumber = 5;
	global.use_temperature = false;
	global.timedgatetimer = false;
	global.timedgatetime = 0;
	global.timedgateid = noone;
	global.timedgatetimemax = 0;
	global.key_inv = false;
	global.shroomfollow = false;
	global.cheesefollow = false;
	global.tomatofollow = false;
	global.sausagefollow = false;
	global.pineapplefollow = false;
	global.pepanimatronic = false;
	global.keyget = false;
	global.collect = 0;
	global.lastcollect = 0;
	global.collectN = 0;
	global.collect_player[0] = 0;
	global.collect_player[1] = 0;
	global.hats = 0;
	global.extrahats = 0;
	global.treasure = false;
	global.combo = 0;
	global.previouscombo = 0;
	global.combotime = 0;
	global.combotimepause = 0;
	global.prank_enemykilled = false;
	global.prank_cankillenemy = true;
	global.tauntcount = 0;
	global.comboscore = 0;
	global.savedcomboscore = 0;
	global.savedcombo = 0;
	global.heattime = 0;
	global.pizzacoinOLD = 0;
	global.toppintotal = 1;
	global.hit = 0;
	global.hp = 2;
	global.gotshotgun = false;
	global.showgnomelist = true;
	global.panic = false;
	global.snickchallenge = false;
	global.golfhit = 0;
	global.style = -1;
	global.secretfound = 0;
	global.shotgunammo = 0;
	global.monsterspeed = 0;
	global.monsterlives = 3;
	global.giantkey = false;
	global.coop = false;
	global.baddiespeed = 1;
	global.baddiepowerup = false;
	global.baddierage = false;
	global.style = 0;
	global.stylethreshold = 0;
	global.pizzadelivery = false;
	global.failcutscene = false;
	global.pizzasdelivered = 0;
	global.spaceblockswitch = true;
	global.gerome = false;
	global.pigtotal_add = 0;
	global.bullet = 0;
	global.fuel = 3;
	global.ammorefill = 0;
	global.ammoalt = 1;
	global.mort = false;
	global.stylelock = false;
	global.pummeltest = true;
	global.horse = false;
	global.checkpoint_room = -4;
	global.checkpoint_door = "A";
	global.kungfu = false;
	global.graffiticount = 0;
	global.graffitimax = 20;
	global.noisejetpack = false;
	global.hasfarmer = array_create(3, false);
	global.savedattackstyle = -4;
	global.snickrematch = false;
	global.checkpoint_data = noone;
	global.resetdoise = false;

	global.swap_boss_damage = 0;
	global.hidetiles = false;
	global.hub_bgsprite = noone;
	global.bossplayerhurt = false;
	global.boss_invincible = false;
	global.highest_combo = 0;
	global.player_damage = 0;
	global.peppino_damage = 0;
	global.gustavo_damage = 0;
	global.enemykilled = 0;
	global.johnresurrection = false;
	global.startgate = false;
	global.bossintro = false;
	global.palettetexture = noone;
	global.palettesurface = noone;
	global.palettesurfaceclip = noone;
	global.levelattempts = 0;
	global.exitrank = false;
	global.playerhit = 0;
	global.door_sprite = spr_door;
	global.door_index = 0;
	global.pistol = false;
	global.bombs = false;
	
	global.snd_escaperumble = fmod_event_create_instance("event:/sfx/misc/escaperumble");
	global.snd_johndead = fmod_event_create_instance("event:/sfx/enemies/johndead");
	global.snd_fakesanta = fmod_event_create_instance("event:/sfx/enemies/fakesanta");
	global.snd_rankup = fmod_event_create_instance("event:/sfx/ui/rankup");
	global.snd_pizzafacemoving = fmod_event_create_instance("event:/sfx/pizzaface/moving");
	global.snd_rankdown = fmod_event_create_instance("event:/sfx/ui/rankdown");
	global.snd_breakblock = fmod_event_create_instance("event:/sfx/misc/breakblock");
	global.snd_bellcollect = fmod_event_create_instance("event:/sfx/misc/bellcollect");
	global.snd_cardflip = fmod_event_create_instance("event:/sfx/misc/cardflip");
	global.snd_explosion = fmod_event_create_instance("event:/sfx/misc/explosion");
	global.snd_cheesejump = fmod_event_create_instance("event:/sfx/pep/cheesejump");
	global.snd_ventilator = fmod_event_create_instance("event:/sfx/misc/ventilator");
	global.snd_trashjump1 = fmod_event_create_instance("event:/sfx/misc/trashjump1");
	global.snd_thunder = fmod_event_create_instance("event:/sfx/knight/thunder");
	global.snd_captaingoblinshoot = fmod_event_create_instance("event:/sfx/misc/captaingoblinshoot");
	global.snd_golfjingle = fmod_event_create_instance("event:/sfx/misc/golfjingle");
	global.snd_mrstickhat = fmod_event_create_instance("event:/sfx/misc/mrstickhat");
	global.snd_alarm = fmod_event_create_instance("event:/sfx/enemies/alarm");
	global.snd_alarm_baddieID = noone;
	global.snd_slidersfx = fmod_event_create_instance("event:/sfx/ui/slidersfx");
	global.snd_slidermusic = fmod_event_create_instance("event:/sfx/ui/slidermusic");
	global.snd_slidermaster = fmod_event_create_instance("event:/sfx/ui/slidersfxmaster");
	global.snd_bossbeaten = fmod_event_create_instance("event:/sfx/misc/bossbeaten");
	
	global.current_level = noone;
	enum VIGI_WEAPONS
	{
		dynamite,
		hook,
		rocket
	}
	global.vigiweapon = VIGI_WEAPONS.dynamite;
}

function scr_player_cleanup()
{
	if !global.player_started
		exit;
	global.player_started = false;
	
	ds_list_destroy(global.saveroom);
	ds_list_destroy(global.escaperoom);
	ds_list_destroy(global.instancelist);
	ds_list_destroy(global.followerlist);
	ds_list_destroy(global.baddieroom);
	
	destroy_sounds([
		global.snd_escaperumble,
		global.snd_johndead,
		global.snd_fakesanta,
		global.snd_rankup,
		global.snd_pizzafacemoving,
		global.snd_rankdown,
		global.snd_breakblock,
		global.snd_bellcollect,
		global.snd_cardflip,
		global.snd_explosion,
		global.snd_cheesejump,
		global.snd_ventilator,
		global.snd_trashjump1,
		global.snd_thunder,
		global.snd_captaingoblinshoot,
		global.snd_golfjingle,
		global.snd_mrstickhat,
		global.snd_alarm,
		global.snd_slidersfx,
		global.snd_slidermusic,
		global.snd_slidermaster,
		global.snd_bossbeaten
	]);
}
