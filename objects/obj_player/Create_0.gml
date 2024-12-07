// super failsafe bros
if instance_number(object_index) > 1
{
	if DEBUG
		show_message(concat("!! NEW obj_player INSTANCE !! room: ", room));
	else
	{
		instance_destroy();
		exit;
	}
}

// sounds
soundinit = false;
player_sounds =
[
	{ e: "snd_voiceok" },
	{ e: "snd_voicetransfo" },
	{ e: "snd_voiceouttransfo" },
	{ e: "snd_voicehurt" },
	{ s: global, e: "snd_fireass" },
	{ s: global, e: "snd_parry" },
	{ s: global, e: "snd_supertaunt" },
	{ s: global, e: "snd_rank" },
	{ e: "snd_uppercut" },
	{ s: global, e: "snd_spaceship" },
	{ e: "machsnd" },
	{ e: "jumpsnd" },
	
	{ e: "machrollsnd" },
	{ e: "weeniebumpsnd" },
	{ e: "knightslidesnd" },
	{ e: "gravecorpsesnd" },
	{ e: "barrelslidesnd" },
	{ e: "barrelbumpsnd" },
	{ e: "waterslidesnd" },
	{ e: "mrpinchsnd" },
	{ e: "hamkuffsnd" },
	{ e: "ratmountmachsnd" },
	{ e: "ratmountballsnd" },
	{ e: "ratmountgroundpoundsnd" },
	{ e: "ratmountpunchsnd" },
	{ e: "cheeseballsnd" },
	{ e: "boxxedspinsnd" },
	{ e: "pizzapeppersnd" },
	{ e: "ratdeflatesnd" },
	{ e: "ghostspeedsnd" },
	{ e: "freefallsnd" },
	{ e: "rollgetupsnd" },
	{ e: "tumblesnd" },
	{ e: "snd_dive" },
	{ e: "snd_crouchslide" },
	{ e: "snd_dashpad" },
	{ e: "animatronicsnd" },
	{ e: "burpsnd" },
	{ e: "superjumpsnd" },
	{ e: "suplexdashsnd" },
	{ e: "gallopingsnd" },
	{ e: "snd_jetpackloop" },
	{ e: "sjumpcancelsnd" },
	
	{ e: "snd_wallbounce" },
	{ e: "snd_divebomb" },
	{ e: "snd_airspin" },
	{ e: "snd_noisemach" },
	{ e: "snd_noiseSjump" },
	{ e: "snd_noiseSjumprelease" },
	{ e: "snd_noisedoublejump" },
	{ e: "snd_noisepunch" }, 
	{ e: "snd_minijetpack" },
	{ e: "snd_noisefiremouth" },
	{ e: "snd_rushdown" },
	{ e: "snd_rushdownhit" },
	{ e: "snd_minigun" },
	{ e: "snd_ghostdash" },
	{ e: "snd_bossdeathN" },
	{ e: "snd_noiseanimatronic" },
	
	{ s: global, e: "snd_secretwall" },
	{ e: "flippingsnd" },
	{ e: "spindashsnd" },
	{ e: "snd_vigislide" },
	{ e: "breakdancesnd" },
	{ e: "breakdancecancelsnd" },
	{ e: "tauntsnd" },
];

function player_list_sounds()
{
	var p = [];
	for(var i = 0; i < array_length(player_sounds); i++)
	{
		var this = player_sounds[i];
		var s = this[$ "s"] ?? self;
		array_push(p, s[$ this.e]);
	}
	return p;
}

function player_destroy_sounds()
{
	if !soundinit exit;
	destroy_sounds(player_list_sounds());
}

function player_init_sounds()
{
	soundinit = true;
	
	// taunt
	if SUGARY_SPIRE && character == "SP"
		tauntsnd = fmod_event_create_instance("event:/modded/sfx/pizzytaunt");
	else
		tauntsnd = fmod_event_create_instance("event:/sfx/pep/taunt");
	
	// general
	if character == "V"
	{
		machsnd = fmod_event_create_instance("event:/modded/playerV/mach");
		jumpsnd = fmod_event_create_instance("event:/modded/playerV/jump");
		breaksnd = "event:/modded/playerV/break";
		machslidesnd = "event:/modded/playerV/machslideboost";
		stepsnd = "event:/modded/playerV/step";
		landsnd = "event:/modded/playerV/land";
	}
	else if SUGARY_SPIRE && character == "SP"
	{
		machsnd = fmod_event_create_instance("event:/sfx/pep/mach");
		jumpsnd = fmod_event_create_instance("event:/sfx/pep/jump");
		breaksnd = "event:/sfx/playerN/break";
		machslidesnd = "event:/sfx/playerN/machslide";
		stepsnd = "event:/sfx/pep/step";
		landsnd = "event:/sfx/pep/step";
	}
	else
	{
		machsnd = fmod_event_create_instance("event:/sfx/pep/mach");
		jumpsnd = fmod_event_create_instance(character == "N" ? "event:/sfx/playerN/jump" : "event:/sfx/pep/jump");
		breaksnd = character == "N" ? "event:/sfx/playerN/break" : "event:/sfx/pep/break";
		machslidesnd = character == "N" ? "event:/sfx/playerN/machslide" : "event:/sfx/pep/machslideboost";
		stepsnd = "event:/sfx/pep/step";
		landsnd = "event:/sfx/pep/step";
	}
	
	// collect
	if SUGARY_SPIRE && character == "SP"
	{
		global.snd_collect = "event:/modded/sfx/collectSP";
		global.snd_collectpizza = "event:/modded/sfx/collectSP";
		global.snd_collectgiantpizza = "event:/modded/sfx/collectgiantpizzaSP";
	}
	else
	{
		global.snd_collect = "event:/sfx/misc/collect";
		global.snd_collectpizza = "event:/sfx/misc/collectpizza";
		global.snd_collectgiantpizza = "event:/sfx/misc/collectgiantpizza";
	}
	
	// the voices
	if character != "S"
	{
		var g = isgustavo && character != "N";
		snd_voiceok = fmod_event_create_instance(g ? "event:/sfx/voice/gusok" : "event:/sfx/voice/ok");
		snd_voicetransfo = fmod_event_create_instance("event:/sfx/voice/transfo");
		snd_voiceouttransfo = fmod_event_create_instance("event:/sfx/voice/outtransfo");
		snd_voicehurt = fmod_event_create_instance(g ? "event:/sfx/voice/gushurt" : "event:/sfx/voice/hurt");
		snd_voicemyea = "event:/sfx/voice/myea";
	}
	else
	{
		snd_voiceok = fmod_event_create_instance("event:/nosound");
		snd_voicetransfo = fmod_event_create_instance("event:/nosound");
		snd_voiceouttransfo = fmod_event_create_instance("event:/nosound");
		snd_voicehurt = fmod_event_create_instance("event:/nosound");
		snd_voicemyea = "event:/nosound";
	}
	
	// fireass
	if character == "SP"
		global.snd_fireass = fmod_event_create_instance(concat("event:/modded/sfx/fireass", character));
	else if character != "S"
		global.snd_fireass = fmod_event_create_instance(concat("event:/sfx/pep/fireass", character));
	else
		global.snd_fireass = fmod_event_create_instance("event:/sfx/pep/fireass");
	
	// parry
	if SUGARY_SPIRE && (character == "SP" or character == "SN")
		global.snd_parry = fmod_event_create_instance("event:/modded/sfx/parrySP");
	else
		global.snd_parry = fmod_event_create_instance("event:/sfx/pep/parry");
	
	if BO_NOISE && character == "BN"
		global.snd_supertaunt = fmod_event_create_instance("event:/modded/sfx/supertauntBN");
	else if SUGARY_SPIRE && (character == "SP" or character == "SN")
		global.snd_supertaunt = fmod_event_create_instance("event:/modded/sfx/supertauntSP");
	else
		global.snd_supertaunt = fmod_event_create_instance("event:/sfx/pep/supertaunt");
	
	// rank
	if SUGARY_SPIRE && (character == "SP" or character == "SN")
		global.snd_rank = fmod_event_create_instance("event:/modded/sugary/rankSP");
	else if BO_NOISE && character == "BN"
		global.snd_rank = fmod_event_create_instance("event:/music/rankBN");
	else
		global.snd_rank = fmod_event_create_instance("event:/music/rank");
	
	// toppincolect
	if SUGARY_SPIRE && (character == "SP" or character == "SN")
		global.snd_collecttoppin = "event:/modded/sfx/collecttoppinSP";
	else
		global.snd_collecttoppin = "event:/sfx/misc/collecttoppin";
	
	// boss scream
	if character != "S"
		global.snd_screamboss = "event:/sfx/pep/screamboss";
	else
		global.snd_screamboss = "event:/modded/sfx/enemyscream";
	
	// uppercut
	if character == "V"
		snd_uppercut = fmod_event_create_instance("event:/sfx/vigilante/uzijump");
	else
		snd_uppercut = fmod_event_create_instance("event:/sfx/pep/uppercut");
	
	// spaceship scream
	if character != "S"
		global.snd_spaceship = fmod_event_create_instance("event:/sfx/misc/spaceship");
	else
		global.snd_spaceship = fmod_event_create_instance("event:/sfx/misc/spaceshiptemp");
    
    // normal sounds
    machrollsnd = fmod_event_create_instance("event:/sfx/pep/machroll");
    weeniebumpsnd = fmod_event_create_instance("event:/sfx/weenie/bump");
    knightslidesnd = fmod_event_create_instance("event:/sfx/knight/slide");
    gravecorpsesnd = fmod_event_create_instance("event:/sfx/pep/gravecorpse");
    barrelslidesnd = fmod_event_create_instance("event:/sfx/barrel/slide");
    barrelbumpsnd = fmod_event_create_instance("event:/sfx/barrel/bump");
    waterslidesnd = fmod_event_create_instance("event:/sfx/misc/waterslide");
    mrpinchsnd = fmod_event_create_instance("event:/sfx/misc/mrpinch");
    hamkuffsnd = fmod_event_create_instance("event:/sfx/misc/hamkuff");
    ratmountmachsnd = fmod_event_create_instance("event:/sfx/ratmount/mach");
    ratmountballsnd = fmod_event_create_instance("event:/sfx/ratmount/ball");
    ratmountgroundpoundsnd = fmod_event_create_instance("event:/sfx/ratmount/groundpound");
    ratmountpunchsnd = fmod_event_create_instance("event:/sfx/ratmount/punch");
    cheeseballsnd = fmod_event_create_instance("event:/sfx/cheese/ball");
    boxxedspinsnd = fmod_event_create_instance("event:/sfx/boxxed/spin");
    pizzapeppersnd = fmod_event_create_instance("event:/sfx/pep/pizzapepper");
    ratdeflatesnd = fmod_event_create_instance("event:/sfx/rat/deflate");
    ghostspeedsnd = fmod_event_create_instance("event:/sfx/pep/ghostspeed");
    freefallsnd = fmod_event_create_instance("event:/sfx/pep/freefall");
    rollgetupsnd = fmod_event_create_instance("event:/sfx/pep/rollgetup");
    tumblesnd = fmod_event_create_instance("event:/sfx/pep/tumble");
    snd_dive = fmod_event_create_instance("event:/sfx/pep/dive");
    snd_crouchslide = fmod_event_create_instance("event:/sfx/pep/crouchslide");
    snd_dashpad = fmod_event_create_instance("event:/sfx/misc/dashpad");
    animatronicsnd = fmod_event_create_instance("event:/sfx/pep/animatronic");
    burpsnd = fmod_event_create_instance("event:/sfx/enemies/burp");
    superjumpsnd = fmod_event_create_instance("event:/sfx/pep/superjump");
    suplexdashsnd = fmod_event_create_instance("event:/sfx/pep/suplexdash");
    gallopingsnd = fmod_event_create_instance("event:/sfx/misc/galloping");
    snd_jetpackloop = fmod_event_create_instance("event:/sfx/noise/jetpackloop");
    sjumpcancelsnd = fmod_event_create_instance("event:/sfx/pep/superjumpcancel");
    
    snd_wallbounce = fmod_event_create_instance("event:/sfx/playerN/wallbounce");
    snd_divebomb = fmod_event_create_instance("event:/sfx/playerN/divebomb");
    snd_airspin = fmod_event_create_instance("event:/sfx/playerN/airspin");
    snd_noisemach = fmod_event_create_instance("event:/sfx/playerN/mach");
    snd_noiseSjump = fmod_event_create_instance("event:/sfx/playerN/superjump");
    snd_noiseSjumprelease = fmod_event_create_instance("event:/sfx/playerN/superjumprelease");
    snd_noisedoublejump = fmod_event_create_instance("event:/sfx/playerN/doublejump");
    snd_noisepunch = fmod_event_create_instance("event:/sfx/playerN/punch");
    snd_minijetpack = fmod_event_create_instance("event:/sfx/playerN/minijetpack");
    snd_noisefiremouth = fmod_event_create_instance("event:/sfx/playerN/firemouthjump");
    snd_rushdown = fmod_event_create_instance("event:/sfx/playerN/rushdownloop");
    snd_rushdownhit = fmod_event_create_instance("event:/sfx/playerN/rushdownhit");
    snd_minigun = fmod_event_create_instance("event:/sfx/playerN/minigunloop");
    snd_ghostdash = fmod_event_create_instance("event:/sfx/playerN/ghostdash");
    snd_bossdeathN = fmod_event_create_instance("event:/sfx/playerN/bossdeath");
    snd_noiseanimatronic = fmod_event_create_instance("event:/Sfx/playerN/animatronic");
    
    // pto extra
    global.snd_secretwall = fmod_event_create_instance("event:/modded/sfx/secretwall");
    flippingsnd = fmod_event_create_instance("event:/modded/sfx/pizzyflip");
    spindashsnd = fmod_event_create_instance("event:/modded/sfx/snick/spindashrev");
    snd_vigislide = fmod_event_create_instance("event:/sfx/vigilante/slide");
    breakdancesnd = fmod_event_create_instance("event:/sfx/misc/breakdance");
    breakdancecancelsnd = fmod_event_create_instance("event:/modded/sfx/breakdancecancel");
}

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

// init my ballsack
init_collision();
target_vsp = 0;
target_hsp = 0;

resetdoisecount = 0;
global.resetdoise = false;

global.swap_boss_damage = 0;
global.throwarc = 1;
global.hidetiles = false;
global.leveltosave = noone;
global.leveltorestart = noone;
global.hub_bgsprite = noone;
global.offload_tex = noone;
global.bossplayerhurt = false;
global.boss_invincible = false;
global.highest_combo = 0;
global.player_damage = 0;
global.swap_damage[0] = 0;
global.swap_damage[1] = 0;
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
global.swapmode = false;
global.door_sprite = spr_door;
global.door_index = 0;
global.pistol = false;
global.bombs = false;

fightball_buffer1 = 0;
fightball_buffer2 = 0;
fightball_snd_buffer = 0;
input_taunt_p2 = 0;
supernoisefademax = 4;
supernoisefade = (supernoisefademax * 20) / 2;
supernoisetimer = 0;
supernoisefx = 0;
bombreadybuffer = 0;
savedmove = 0;
noisepeppermissile = 0;
noisepizzapepper = false;
noisejetpackbuffer = 0;
ignore_grind = false;
noisemachcancel = 0;
move_h = 0;
move_v = 0;
steppybuffer = 0;
noisecrusher = false;
noisemachcancelbuffer = 0;
noisewalljump = 0;
noisedoublejump = false;

lastroom_soundtest = room;
lastroom_secretportalID = -4;
dropboost = false;

mach1snd = -1;
mach2snd = -1;
mach3snd = -1;
knightslide = -1;
bombpep1snd = -1;
mach4snd = -1;
tumble2snd = -1;
tumble1snd = -1;
tumble3snd = -1;
tumbleintro = false;
rocketsnd = -1;
superjumpholdsnd = -1;
superjumpprepsnd = -1;

uncrouch = 0;
parryID = noone;
bodyslam_notif = false;
swingdingthrow = false;
sjumptimer = 0;
can_jump = false;
coyote_time = 0;
invtime = 0;
parry_lethal = false;
usepalette = true;
jetpackeffect = 0;
superchargebuffer = 0;
fireasseffect = 0;
pistolanim = noone;
pistolindex = 0;
pistolcooldown = 0;
pistolchargesound = false;
policetaxi = false;
collision_flags = 0;
breakdance_pressed = 0;
restartbuffer = 0;
jetpackdash = false;
flamecloud_buffer = 0;
rankpos_x = x;
rankpos_y = y;
transformationlives = 0;
punch_afterimage = 0;
superchargecombo_buffer = -1;
superattackstate = states.normal;
afterimagedebris_buffer = 0;
scale_xs = 1;
scale_ys = 1;
verticalbuffer = 0;
verticalstate = states.normal;
webID = noone;
float = false;
boxxedpepjump = 10;
boxxedpepjumpmax = 10;
icemovespeed = 0;
prevmove = 0;
prevhsp = 0;
prevstate = states.normal;
prevxscale = 1;
prevsprite = sprite_index;
move = 0;
prevmovespeed = 0;
previcemovespeed = 0;
icedir = 1;
icemomentum = false;
savedicedir = 1;
isgustavo = false;
jumped = true;
rocketvsp = 0;
sticking = false;
xscale = 1;
yscale = 1;
facehurt = false;
steppy = false;
steppybuffer = 0;
depth = -7;
movespeed = 19;
jumpstop = false;
ramp = false;
ramp_points = 0;
bombup_dir = 1;
knightmomentum = 0;
grabbingenemy = false;
blur_effect = 0;
firemouth_dir = 1;
firemouth_max = 10;
firemouth_buffer = firemouth_max;
firemouth_afterimage = 0;
cow_buffer = 0;
balloonbuffer = 0;
shoot_buffer = 0;
shoot_max = 20;
dynamite_inst = noone;
golfid = noone;
bombgrabID = noone;
barrelslope = false;
barrel_maxmovespeed = 16;
barrel_maxfootspeed = 10;
barrel_rollspeed_threshold = 10;
barrel_accel = 1;
barrel_deccel = 1;
barrel_slopeaccel = 0.25;
barrel_slopedeccel = 0.5;
barrelroll_slopeaccel = 0.5;
barrelroll_slopedeccel = 0.35;
hurt_buffer = -1;
hurt_max = 120;
invhurt_buffer = 0;
invhurt_max = 30;
ratmount_movespeed = 8;
ratmount_fallingspeed = 0;
ratgrabbedID = noone;
ratpowerup = noone;
ratshootbuffer = 0;
rateaten = false;
gustavodash = 0;
brick = false;
ratmountpunchtimer = 25;
gustavokicktimer = 5;
cheesepep_buffer = 0;
cheesepep_max = 10;
pepperman_accel = 0.25;
pepperman_deccel = 0.5;
pepperman_accel_air = 0.15;
pepperman_deccel_air = 0.25;
pepperman_maxhsp_normal = 6;
pepperman_jumpspeed = 11;
pepperman_grabID = noone;
shoulderbash_mspeed_start = 12;
shoulderbash_mspeed_loop = 10;
shoulderbash_jumpspeed = 11;
visible = true;
state = states.titlescreen;
jumpAnim = true;
landAnim = false;
machslideAnim = false;
moveAnim = true;
stopAnim = true;
crouchslideAnim = true;
crouchAnim = true;
machhitAnim = false;
stompAnim = false;
inv_frames = false;
hurted = false;
autodash = false;
mach2 = 0;
stop_buffer = 8;
slope_buffer = 8;
stop_max = 16;
parry = false;
parry_inst = noone;
taunt_to_parry_max = 8;
parrytimer = 0;
parry_count = 0;
parry_max = 8;
is_firing = false;
input_buffer_jump = 0;
input_buffer_down = 0;
input_buffer_mach = 0;
input_buffer_jump_negative = 0;
input_buffer_shoot = 0;
input_buffer_secondjump = 8;
input_buffer_highjump = 8;
input_buffer_walljump = 0;
input_buffer_slap = 0;
input_attack_buffer = 0;
input_finisher_buffer = 0;
input_up_buffer = 0;
input_down_buffer = 0;
hit_connected = false;
player_x = x;
player_y = y;
targetRoom = tower_entrancehall;
targetDoor = "A";
scr_init_input();
flash = false;
key_particles = false;
barrel = false;
bounce = false;
a = 0;
idle = 0;
attacking = false;
slamming = false;
superslam = 0;
grinding = false;
machpunchAnim = false;
punch = false;
machfreefall = 0;
shoot = false;
instakillmove = false;
stunmove = false;
windingAnim = 0;
facestompAnim = false;
ladderbuffer = 0;
toomuchalarm1 = 0;
toomuchalarm2 = 0;
idleanim = 0;
momemtum = false;
cutscene = false;
grabbing = false;
dir = xscale;
shotgunAnim = false;
goingdownslope = false;
goingupslope = false;
fallinganimation = 0;
bombpeptimer = 100;
suplexmove = false;
suplexhavetomash = 0;
anger = 0;
angry = false;
baddiegrabbedID = noone;

paletteselect = 1;
player_paletteselect[0] = 1;
player_patterntexture[0] = -4;
player_paletteselect[1] = 1;
player_patterntexture[1] = -4;
player_paletteindex = 0;
player_index = 0;

spr_palette = spr_peppalette;
character = "P";
scr_characterspr();
swap_taunt = false;

colorchange = false;
treasure_x = 0;
treasure_y = 0;
treasure_room = 0;
wallspeed = 0;
tauntstoredstate = states.normal;
tauntstoredmovespeed = 6;
tauntstoredsprite = spr_player_idle;
taunttimer = 20;
tauntstoredvsp = 0;
tauntstoredhsp = 0;
tauntstoredisgustavo = false;
tube_id = -1;
backtohubstartx = x;
backtohubstarty = y;
backtohubroom = Mainmenu;
slapcharge = 0;
slaphand = 1;
slapbuffer = 8;
slapflash = 0;
freefallsmash = 0;
costumercutscenetimer = 0;
heavy = false;
lastroom_x = 0;
lastroom_y = 0;
lastroom = 0;
lastTargetoor = "A";
hallway = false;
savedhallway = false;
hallwaydirection = 0;
savedhallwaydirection = 0;
vhallwaydirection = 0;
savedvhallwaydirection = 0;
verticalhallway = false;
savedverticalhallway = false;
vertical_x = x;
verticalhall_vsp = 0;
box = false;
roomstartx = 0;
roomstarty = 0;
swingdingbuffer = 0;
swingdingdash = 0;
lastmove = 0;
backupweapon = false;
stickpressed = false;
spotlight = true;
macheffect = false;
chargeeffectid = obj_null;
dashcloudid = obj_null;
crazyruneffectid = obj_null;
fightball = false;
superslameffectid = obj_null;
speedlineseffectid = obj_null;
angryeffectid = obj_null;
thrown = false;
transformationsnd = false;
hamkuffID = noone;
pogospeed = 2;
pogocharge = 100;
pogochargeactive = false;
wallclingcooldown = 10;
bombcharge = 0;
flashflicker = false;
flashflickertime = 0;
kickbomb = false;
doublejump = false;
pogospeedprev = false;
fightballadvantage = false;
coopdelay = 0;
supercharged = false;
superchargedeffectid = obj_null;
used_supercharge = false;
pizzashield = false;
pizzashieldid = obj_null;
pizzapepper = 0;

// fuck off
transformation = ds_list_create();
ds_list_add(transformation, 
	states.bombpep,
	states.knightpep,
	states.knightpepslopes,
	states.boxxedpep,
	states.cheeseball,
	states.cheesepep,
	states.cheesepepstick,
	states.cheesepepstickup,
	states.cheesepepstickside,
	states.firemouth,
	states.fireass,
	states.stunned,
	states.rideweenie,
	states.dead,
	states.door,
	states.ghost,
	states.ghostpossess,
	states.mort,
	states.tube,
	states.actor,
	states.rocket,
	states.gotoplayer,
	states.bombgrab,
	states.bombpepside,
	states.bombpepup,
	states.barrelslide,
	states.barreljump,
	states.barrel,
	states.cheeseballclimbwall,
	states.motorcycle,
	states.knightpepbump,
	states.knightpepattack,
	states.mortattack,
	states.morthook,
	states.mortjump,
	states.boxxedpepjump,
	states.boxxedpepspin,
	states.rocketslide,
	states.cheesepepjump,
	states.rideweenie,
	states.barrelclimbwall,
	states.cotton,
	states.cottondrill,
	states.cottonroll,
	states.rupertnormal,
	states.rupertslide,
	states.rupertjump,
	states.rupertstick,
	states.hookshot,
);

keysound = false;
c = 0;
stallblock = 0;
breakdance = 50;
skateboarding = false;
hitX = x;
hitY = y;
hithsp = 0;
hitvsp = 0;
hitstunned = 0;
hitxscale = 1;
stunned = 0;
hitLag = 25;
supercharge = 0;
mort = false;
sjumpvsp = -12;
freefallvsp = 15;
hitlist = ds_list_create();
animlist = ds_list_create();
lungeattackID = noone;
lunge_hits = 0;
lunge_hit_buffer = 0;
lunge_buffer = 0;
finisher = false;
finisher_buffer = 0;
finisher_hits = 0;
uplaunch = false;
downlaunch = false;
dash_doubletap = 0;
finishingblow = false;
launch = false;
launched = true;
launch_buffer = 0;
jetpackfuel = 0;
jetpackmax = 200;
walljumpbuffer = 0;
farmerpos = 0;
clowntimer = 0;
knightmiddairstop = 0;
knightmove = -1;

if !variable_global_exists("saveroom") or !ds_exists(global.saveroom, ds_type_list)
{
	global.combodropped = false;
	global.saveroom = ds_list_create();
	global.escaperoom = ds_list_create();
	global.lap = false;
	global.laps = 0;
	global.playerhealth = 100;
	global.instancelist = ds_list_create();
	global.followerlist = ds_list_create();
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
	global.pizzacoin = 0;
	global.toppintotal = 1;
	global.hit = 0;
	global.baddieroom = ds_list_create();
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
}
angle = 0;
mach4mode = false;
railmomentum = false;
railmovespeed = 0;
raildir = 1;
boxxed = false;
boxxeddash = false;
boxxeddashbuffer = 0;
cheesepeptimer = -1;
cheeseballbounce = 0;
slopejump = false;
slopejumpx = 0;
hooked = false;
swingdingendcooldown = 0;
crouchslipbuffer = 0;
breakdance_speed = 0.25;
notecreate = 50;
jetpackbounce = false;
firemouthflames = false;
ghostdash = false;
ghostdashcooldown = 0;
ghostdashmovespeed = 0;
ghostpepper = 0;
ghosteffect = 0;
ghostbump = 1;
ghostbumpbuffer = -1;
dashcloudtimer = 0;
grabclimbbuffer = 0;
gustavohitwall = false;
gusdashpadbuffer = 0;
holycross = 0;
knightdowncloud = false;
piledrivereffect = 0;
fireasslock = false;
pistolcharge = 0;
pistolcharged = false;
pistolchargebuffer = 0;
pistolchargedelay = 5;
pistolchargeshooting = false;
pistolchargeshot = 8;
pistolchargeeffect = 0;
gravesurfingjumpbuffer = 0;
spinsndbuffer = 5;
boxxedspinbuffer = 0;
noisebossscream = false;
tornadolandanim = 0;
bombthrow = false;

// pto new
global.current_level = -4;
secretportalID = noone;
smoothx = 0;
oldHallway = false;
noisetype = noisetype.base;
input_buffer_pistol = 0;
input_buffer_grab = 0;
keydoor = false;
pistol = false;
jetpackcancel = false;
suplexmove2 = false;
breakout = 0;
shaketime = 0;
hat = -1;
pet = -1;
pet_prev = -1;
petID = noone;
superjumped = false;
image_blend_func = noone;
substate = states.normal;
drillspeed = 0;
cyop_backtohubroom = noone;
cyop_backtohubx = 0;
cyop_backtohuby = 0;
gravityjump = false;
gravityangle = 0;
ceilingrun = false;
global.swap_characters = ["N", "P"];
global.swap_index = 0;
custom_palette = false;
custom_palette_array = array_create(64);
do_vigislide = true;
global.file_laps = 0;
global.file_retries = 0;
burning = 0;
burneffectID = noone;

enum vweapons
{
	dynamite,
	hook,
	rocket
}
global.vigiweapon = vweapons.dynamite;
vigi_uppercut_nerf = 0;
vigi_slide_buffer = 0;

exitgate_x = 0;
exitgate_y = 0;
exitgate_room = noone;

attackstyletip = false;
