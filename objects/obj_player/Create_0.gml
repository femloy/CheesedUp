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
	
	var custom = scr_modding_character(character);
	if custom == noone
		custom = {};
	else
		custom = custom.sounds;
	
	var tauntpath = custom[$ "taunt"] ?? "event:/sfx/pep/taunt";
	var machpath = custom[$ "mach"] ?? "event:/sfx/pep/mach";
	var jumppath = custom[$ "jump"] ?? "event:/sfx/pep/jump";
	var breakpath = custom[$ "break"] ?? "event:/sfx/pep/break";
	var machslidepath = custom[$ "machslideboost"] ?? "event:/sfx/pep/machslideboost";
	var steppath = custom[$ "step"] ?? "event:/sfx/pep/step";
	var landpath = custom[$ "land"] ?? steppath;
	var collectpath = custom[$ "collect"] ?? "event:/sfx/misc/collect";
	var collectpizzapath = custom[$ "collectpizza"] ?? "event:/sfx/misc/collectpizza";
	var collectgiantpizzapath = custom[$ "collectgiantpizza"] ?? "event:/sfx/misc/collectgiantpizza";
	var voiceokpath = custom[$ "voiceok"] ?? "event:/sfx/voice/ok";
	var voicegusokpath = custom[$ "voicegusok"] ?? "event:/sfx/voice/gusok";
	var voicetransfopath = custom[$ "voicetransfo"] ?? "event:/sfx/voice/transfo";
	var voiceouttransfopath = custom[$ "voiceouttransfo"] ?? "event:/sfx/voice/outtransfo";
	var voicehurtpath = custom[$ "voicehurt"] ?? "event:/sfx/voice/hurt";
	var voicegushurtpath = custom[$ "voicegushurt"] ?? "event:/sfx/voice/gushurt";
	var voicemyeapath = custom[$ "voicemyea"] ?? "event:/sfx/voice/myea";
	var fireasspath = custom[$ "fireass"] ?? concat("event:/sfx/pep/fireass", character);
	var parrypath = custom[$ "parry"] ?? "event:/sfx/pep/parry";
	var supertauntpath = custom[$ "supertaunt"] ?? "event:/sfx/pep/supertaunt";
	var rankpath = custom[$ "rank"] ?? "event:/music/rank";
	var screambosspath = custom[$ "screamboss"] ?? "event:/sfx/pep/screamboss";
	var uppercutpath = custom[$ "uppercut"] ?? "event:/sfx/pep/uppercut";
	var spaceshippath = custom[$ "spaceship"] ?? "event:/sfx/misc/spaceship";
	var superjumppath = custom[$ "superjump"] ?? "event:/sfx/pep/superjump";
	var suplexdashpath = custom[$ "suplexdash"] ?? "event:/sfx/pep/suplexdash";
	var superjumpcancelpath = custom[$ "superjumpcancel"] ?? "event:/sfx/pep/superjumpcancel";
	var freefallpath = custom[$ "freefall"] ?? "event:/sfx/pep/freefall";
	var machrollpath = custom[$ "machroll"] ?? "event:/sfx/pep/machroll";
	var secretwallpath = custom[$ "secretwall"] ?? "event:/modded/sfx/secretwall";
	var breakdancepath = custom[$ "breakdance"] ?? "event:/sfx/misc/breakdance";
	
	// taunt
	tauntsnd = fmod_event_create_instance(tauntpath);
	
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
	else if character == "N"
	{
		machsnd = fmod_event_create_instance(machpath);
		jumpsnd = fmod_event_create_instance("event:/sfx/playerN/jump");
		breaksnd = "event:/sfx/playerN/break";
		machslidesnd = "event:/sfx/playerN/machslide";
		stepsnd = "event:/sfx/pep/step";
		landsnd = "event:/sfx/pep/step";
	}
	else
	{
		machsnd = fmod_event_create_instance(machpath);
		jumpsnd = fmod_event_create_instance(jumppath);
		breaksnd = breakpath;
		machslidesnd = machslidepath;
		stepsnd = steppath;
		landsnd = landpath;
	}
	
	// collect
	global.snd_collect = collectpath;
	global.snd_collectpizza = collectpizzapath;
	global.snd_collectgiantpizza = collectgiantpizzapath;
	
	// the voices
	if character != "S"
	{
		var g = isgustavo && character != "N";
		snd_voiceok = fmod_event_create_instance(g ? voicegusokpath : voiceokpath);
		snd_voicetransfo = fmod_event_create_instance(voicetransfopath);
		snd_voiceouttransfo = fmod_event_create_instance(voiceouttransfopath);
		snd_voicehurt = fmod_event_create_instance(g ? voicegushurtpath : voicehurtpath);
		snd_voicemyea = voicemyeapath;
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
	if character != "S"
		global.snd_fireass = fmod_event_create_instance(fireasspath);
	else
		global.snd_fireass = fmod_event_create_instance("event:/sfx/pep/fireass");
	
	// taunt attacks
	global.snd_parry = fmod_event_create_instance(parrypath);
	global.snd_supertaunt = fmod_event_create_instance(supertauntpath);
	
	// rank
	global.snd_rank = fmod_event_create_instance(rankpath);
	
	// toppincolect
	var collecttoppinpath = "event:/sfx/misc/collecttoppin";
	global.snd_collecttoppin = collecttoppinpath;
	
	// boss scream
	if character != "S"
		global.snd_screamboss = screambosspath;
	else
		global.snd_screamboss = "event:/modded/sfx/enemyscream";
	
	// uppercut
	if character == "V"
		snd_uppercut = fmod_event_create_instance("event:/sfx/vigilante/uzijump");
	else
		snd_uppercut = fmod_event_create_instance(uppercutpath);
	
	// spaceship scream
	if character != "S"
		global.snd_spaceship = fmod_event_create_instance(spaceshippath);
	else
		global.snd_spaceship = fmod_event_create_instance("event:/sfx/misc/spaceshiptemp");
    
    // normal sounds
    machrollsnd = fmod_event_create_instance(machrollpath);
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
    freefallsnd = fmod_event_create_instance(freefallpath);
    rollgetupsnd = fmod_event_create_instance("event:/sfx/pep/rollgetup");
    tumblesnd = fmod_event_create_instance("event:/sfx/pep/tumble");
    snd_dive = fmod_event_create_instance("event:/sfx/pep/dive");
    snd_crouchslide = fmod_event_create_instance("event:/sfx/pep/crouchslide");
    snd_dashpad = fmod_event_create_instance("event:/sfx/misc/dashpad");
    animatronicsnd = fmod_event_create_instance("event:/sfx/pep/animatronic");
    burpsnd = fmod_event_create_instance("event:/sfx/enemies/burp");
	
    superjumpsnd = fmod_event_create_instance(superjumppath);
    suplexdashsnd = fmod_event_create_instance(suplexdashpath);
	
    gallopingsnd = fmod_event_create_instance("event:/sfx/misc/galloping");
    snd_jetpackloop = fmod_event_create_instance("event:/sfx/noise/jetpackloop");
    sjumpcancelsnd = fmod_event_create_instance(superjumpcancelpath);
    
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
    snd_noiseanimatronic = fmod_event_create_instance("event:/sfx/playerN/animatronic");
    
    // pto extra
    global.snd_secretwall = fmod_event_create_instance(secretwallpath);
    spindashsnd = fmod_event_create_instance("event:/modded/sfx/snick/spindashrev");
    snd_vigislide = fmod_event_create_instance("event:/sfx/vigilante/slide");
    breakdancesnd = fmod_event_create_instance(breakdancepath);
    breakdancecancelsnd = fmod_event_create_instance("event:/modded/sfx/breakdancecancel");
}

// init my ballsack
init_collision();
target_vsp = 0;
target_hsp = 0;

resetdoisecount = 0;
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
tauntstoredratmount_movespeed = 0;
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
	states.barrelclimbwall
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
custom_palette = false;
custom_palette_array = array_create(64);
do_vigislide = true;
burning = 0;
burneffectID = noone;

vigi_uppercut_nerf = 0;
vigi_slide_buffer = 0;

exitgate_x = 0;
exitgate_y = 0;
exitgate_room = noone;

attackstyletip = false;
