event_inherited();
grav = 0.5;
hsp = 0;
vsp = 0;
movespeed = 0;
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
bombreset = 50;
idlespr = spr_spitcheese_idle;
stunfallspr = spr_spitcheese_stun;
walkspr = spr_spitcheese_idle;
grabbedspr = spr_spitcheese_stun;
scaredspr = spr_spitcheese_scared;
sprite_index = spr_spitcheese_idle;
flash = false;
slapped = false;
birdcreated = false;
boundbox = false;
spr_dead = spr_spitcheese_dead;
important = false;
heavy = false;
depth = 0;
spitcheesespr = spr_spitcheese_spit;
spr_palette = spr_spitcheese_palette;
usepalette = true;

if check_char("V")
{
	paletteselect = 2;
	basepal = 2;
	elitepal = 2;
}
