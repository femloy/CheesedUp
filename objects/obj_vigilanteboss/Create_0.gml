event_inherited();

snotty = check_char("V");

important = true;
scr_vigilante_init_sounds();
attack_list = -4;
currentattack = 0;
skipintro = false;

vigilante_start_attack(0, 0);
vigilante_add_attack(0, 0, vigi_attacks.revolver, 25);
vigilante_add_attack(0, 0, vigi_attacks.revolver, 25);
vigilante_add_attack(0, 0, vigi_attacks.wait, 25);
vigilante_add_attack(0, 0, vigi_attacks.mach, 45);
vigilante_add_attack(0, 0, vigi_attacks.revolver, 25);
vigilante_add_attack(0, 0, vigi_attacks.revolver, 15);
vigilante_add_attack(0, 0, vigi_attacks.mach, 45);
vigilante_end_attack(0, 0);

vigilante_start_attack(0, 1);
vigilante_add_attack(0, 1, vigi_attacks.dynamite);
vigilante_add_attack(0, 1, vigi_attacks.dynamite);
vigilante_add_attack(0, 1, vigi_attacks.dynamite);
vigilante_add_attack(0, 1, vigi_attacks.dynamite);
vigilante_add_attack(0, 1, vigi_attacks.wait, 25);
vigilante_add_attack(0, 1, vigi_attacks.revolver, 10);
vigilante_add_attack(0, 1, vigi_attacks.wait, 35);
vigilante_add_attack(0, 1, vigi_attacks.dynamite);
vigilante_add_attack(0, 1, vigi_attacks.dynamite);
vigilante_add_attack(0, 1, vigi_attacks.dynamite);
vigilante_add_attack(0, 1, vigi_attacks.revolver, 10);
vigilante_add_attack(0, 1, vigi_attacks.revolver, 10);
vigilante_add_attack(0, 1, vigi_attacks.dynamite);
vigilante_add_attack(0, 1, vigi_attacks.dynamite);
vigilante_add_attack(0, 1, vigi_attacks.wait, 15);
vigilante_add_attack(0, 1, vigi_attacks.dynamite);
vigilante_add_attack(0, 1, vigi_attacks.dynamite);
vigilante_add_attack(0, 1, vigi_attacks.mach, 5);
vigilante_add_attack(0, 1, vigi_attacks.wait, 85);
vigilante_add_attack(0, 1, vigi_attacks.revolver, 10);
vigilante_end_attack(0, 1);

vigilante_start_attack(0, 2);
vigilante_add_attack(0, 2, vigi_attacks.machinegun);
vigilante_add_attack(0, 2, vigi_attacks.dynamite);
vigilante_add_attack(0, 2, vigi_attacks.dynamite);
vigilante_end_attack(0, 2);

vigilante_start_attack(0, 3);
vigilante_add_attack(0, 3, vigi_attacks.machinegun);
vigilante_add_attack(0, 3, vigi_attacks.revolver, 10);
vigilante_add_attack(0, 3, vigi_attacks.revolver, 10);
vigilante_add_attack(0, 3, vigi_attacks.revolver, 10);
vigilante_add_attack(0, 3, vigi_attacks.revolver, 10);
vigilante_end_attack(0, 3);

vigilante_start_attack(0, 4);
vigilante_add_attack(0, 4, vigi_attacks.mach, 45);
vigilante_add_attack(0, 4, vigi_attacks.wait, 5);
vigilante_end_attack(0, 4);

vigilante_start_attack(0, 5);
vigilante_add_attack(0, 5, vigi_attacks.bazooka);
vigilante_add_attack(0, 5, vigi_attacks.mach, 20);
vigilante_add_attack(0, 5, vigi_attacks.bazooka);
vigilante_add_attack(0, 5, vigi_attacks.mach, 5);
vigilante_add_attack(0, 5, vigi_attacks.bazooka);
vigilante_add_attack(0, 5, vigi_attacks.mach, 25);
vigilante_add_attack(0, 5, vigi_attacks.wait, 25);
vigilante_add_attack(0, 5, vigi_attacks.dynamite);
vigilante_add_attack(0, 5, vigi_attacks.dynamite);
vigilante_add_attack(0, 5, vigi_attacks.dynamite);
vigilante_add_attack(0, 5, vigi_attacks.revolver, 5);
vigilante_add_attack(0, 5, vigi_attacks.revolver, 5);
vigilante_end_attack(0, 5);

vigilante_start_attack(0, 6);
vigilante_add_attack(0, 6, vigi_attacks.dynamite);
vigilante_add_attack(0, 6, vigi_attacks.dynamite);
vigilante_add_attack(0, 6, vigi_attacks.flamethrower, 200);
vigilante_end_attack(0, 6);

vigilante_start_attack(0, 7);
vigilante_add_attack(0, 7, vigi_attacks.flamethrower, 200);
vigilante_add_attack(0, 7, vigi_attacks.wait, 45);
vigilante_end_attack(0, 7);

vigilante_start_attack(0, 8);
vigilante_add_attack(0, 8, vigi_attacks.crate);
vigilante_add_attack(0, 8, vigi_attacks.wait, 300);
vigilante_add_attack(0, 8, vigi_attacks.dynamite);
vigilante_add_attack(0, 8, vigi_attacks.dynamite);
vigilante_add_attack(0, 8, vigi_attacks.revolver, 5);
vigilante_add_attack(0, 8, vigi_attacks.revolver, 5);
vigilante_add_attack(0, 8, vigi_attacks.dynamite);
vigilante_add_attack(0, 8, vigi_attacks.dynamite);
vigilante_add_attack(0, 8, vigi_attacks.wait, 100);
vigilante_add_attack(0, 8, vigi_attacks.revolver, 5);
vigilante_add_attack(0, 8, vigi_attacks.revolver, 5);
vigilante_add_attack(0, 8, vigi_attacks.dynamite);
vigilante_add_attack(0, 8, vigi_attacks.dynamite);
vigilante_add_attack(0, 8, vigi_attacks.revolver, 5);
vigilante_add_attack(0, 8, vigi_attacks.revolver, 5);
vigilante_add_attack(0, 8, vigi_attacks.dynamite);
vigilante_add_attack(0, 8, vigi_attacks.dynamite);
vigilante_end_attack(0, 8);

vigilante_start_attack(1, 0);
vigilante_add_attack(1, 0, vigi_attacks.dynamite);
vigilante_end_attack(1, 0);

vigilante_start_attack(1, 1);
vigilante_add_attack(1, 1, vigi_attacks.mach, 25);
vigilante_end_attack(1, 1);

vigilante_start_attack(1, 2);
vigilante_add_attack(1, 2, vigi_attacks.revolver, 25);
vigilante_end_attack(1, 2);

vigilante_start_attack(1, 3);
vigilante_add_attack(1, 3, vigi_attacks.dynamite);
vigilante_add_attack(1, 3, vigi_attacks.dynamite);
vigilante_add_attack(1, 3, vigi_attacks.dynamite);
vigilante_add_attack(1, 3, vigi_attacks.dynamite);
vigilante_add_attack(1, 3, vigi_attacks.dynamite);
vigilante_add_attack(1, 3, vigi_attacks.bazooka);
vigilante_end_attack(1, 3);

vigilante_start_attack(1, 4);
vigilante_add_attack(1, 4, vigi_attacks.crate);
vigilante_add_attack(1, 4, vigi_attacks.flamethrower, 1900);
vigilante_end_attack(1, 4);

vigilante_start_attack(1, 5);
vigilante_add_attack(1, 5, vigi_attacks.crate);
vigilante_add_attack(1, 5, vigi_attacks.machinegun);
vigilante_add_attack(1, 5, vigi_attacks.machinegun);
vigilante_add_attack(1, 5, vigi_attacks.machinegun);
vigilante_add_attack(1, 5, vigi_attacks.machinegun);
vigilante_add_attack(1, 5, vigi_attacks.machinegun);
vigilante_add_attack(1, 5, vigi_attacks.machinegun);
vigilante_add_attack(1, 5, vigi_attacks.machinegun);
vigilante_add_attack(1, 5, vigi_attacks.machinegun);
vigilante_add_attack(1, 5, vigi_attacks.machinegun);
vigilante_end_attack(1, 5);

vigilante_start_attack(1, 6);
vigilante_add_attack(1, 6, vigi_attacks.crate);
vigilante_add_attack(1, 6, vigi_attacks.mach, 45);
vigilante_add_attack(1, 6, vigi_attacks.mach, 45);
vigilante_add_attack(1, 6, vigi_attacks.mach, 45);
vigilante_add_attack(1, 6, vigi_attacks.mach, 45);
vigilante_add_attack(1, 6, vigi_attacks.mach, 45);
vigilante_add_attack(1, 6, vigi_attacks.mach, 45);
vigilante_add_attack(1, 6, vigi_attacks.mach, 45);
vigilante_add_attack(1, 6, vigi_attacks.mach, 45);
vigilante_add_attack(1, 6, vigi_attacks.mach, 45);
vigilante_add_attack(1, 6, vigi_attacks.mach, 45);
vigilante_add_attack(1, 6, vigi_attacks.mach, 45);
vigilante_add_attack(1, 6, vigi_attacks.mach, 45);
vigilante_add_attack(1, 6, vigi_attacks.mach, 45);
vigilante_end_attack(1, 6);

vigilante_start_attack(1, 7);
vigilante_add_attack(1, 7, vigi_attacks.mach, 45);
vigilante_end_attack(1, 7);

vigilante_start_attack(1, 8);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 25);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 24);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 23);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 22);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 21);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 20);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 19);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 18);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 17);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 16);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 15);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 14);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 13);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 12);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 11);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 10);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 9);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 8);
vigilante_add_attack(1, 8, vigi_attacks.revolver, 7);
vigilante_add_attack(1, 8, vigi_attacks.wait, 200);
vigilante_end_attack(1, 8);

bossvulnerableID = noone;
targetguy_max = 1000;
alarm[8] = targetguy_max;
crouchalphabuffer = 0;
camzoom = 1;
signspr = spr_preparetodraw;
reposition = false;
signy = -sprite_get_height(signspr);
pizzahead = false;
override_throw = false;
pizzaheadshot = false;

spr_intro1 = spr_vigilante_intro1;
spr_intro2 = spr_vigilante_intro2;
spr_intro2loop = spr_vigilante_intro2loop;
switch obj_player1.character
{
	case "N":
		spr_intro1 = spr_vigilante_intro1N;
		spr_intro2 = spr_vigilante_intro2N;
		break;
	
	case "V":
		spr_intro1 = spr_snotty_intro1;
		spr_intro2 = spr_snotty_intro2;
		spr_intro2loop = spr_snotty_intro2loop;
		break;
}
sprite_index = spr_intro1;

bullethit = 0;
oldspotID = noone;
uzi_speed = 0.35;
parryable = false;
flameID = noone;
playerhit = 0;
reloadbuffer = 0;
kick = false;
jump = false;
introwait = false;
spotID = instance_place(x, y, obj_vigilantespot);
spotlightID = instance_create(x, y, obj_bossspotlight);
spotlightID.objectID = id;
introbuffer = 80;
important = true;
stompable = false;
shakestun = false;
estampedemax = 0;
elite = true;
elitehit = 9;
prevhp = elitehit;
turned = false;
wastedhits = 0;
state = states.arenaintro;
hitboxID = noone;
oldtargetspot = -4;
targetspot = -4;
marbleblockmax = 1;
attackspeed = 0;
hitboxID = noone;
marbleblockID = noone;
destroyable = false;
ministate = states.normal;
minibuffer = 0;
revolverbuffer = 0;
ammo = 6;
shot = 6;
duelphase = 1;
duelplayer = false;
idle_max = 5;
idle_timer = idle_max;
grav = 0.5;
hsp = 0;
vsp = 0;
stunned = 0;
alarm[0] = 150;
roaming = true;
collectdrop = 5;
flying = false;
straightthrow = false;
cigar = false;
cigarcreate = false;
stomped = false;
shot = false;
reset = false;
flash = false;
landspr = spr_playerV_hurt;
idlespr = spr_playerV_hurt;
fallspr = spr_playerV_hurt;
stunfallspr = spr_playerV_stun;
walkspr = spr_playerV_idle;
turnspr = spr_playerV_hurt;
recoveryspr = spr_playerV_hurt;
grabbedspr = spr_playerV_hurt;
scaredspr = spr_playerV_hurt;
ragespr = spr_playerV_hurt;
hp = 1;
slapped = false;
grounded = true;
birdcreated = false;
boundbox = false;
spr_dead = spr_playerV_hurt;
important = false;
heavy = true;

usepalette = true;
use_elite = false;
basepal = 0;
paletteselect = 0;
spr_palette = spr_vigipalette;

if snotty
{
	basepal = SKIN_SNOTTY;
	paletteselect = SKIN_SNOTTY;
}

grabbedby = 0;
stuntouchbuffer = 0;
scaredbuffer = 0;
cooldown = 5;
phase = 1;
dir = 1;
woosh = false;
flickertime = 0;
touchedground = false;
cowcrate = 0;
