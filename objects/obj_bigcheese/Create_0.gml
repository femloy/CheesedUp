event_inherited();
pizzaball = false;
shakestun = false;
parryable = false;
supertauntable = false;
shot = false;
grav = 0.5;
hsp = 0;
vsp = 0;
movespeed = 1;
state = states.walk;
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
hp = 2;
hitboxcreate = false;
grounded = true;
idlespr = spr_bigcheese_idle;
stunfallspr = spr_bigcheese_stun;
walkspr = spr_bigcheese_idle;
grabbedspr = spr_bigcheese_stun;
scaredspr = spr_bigcheese_scared;
flash = false;
slapped = false;
birdcreated = false;
boundbox = false;
spr_dead = spr_bigcheese_dead;
important = false;
depth = 0;
throwspeed = 0.35;

usepalette = true;
paletteselect = 0;
spr_palette = spr_bigcheese_palette;

if check_char("V")
{
	basepal = 2;
	elitepal = 3;
	paletteselect = basepal;
}
