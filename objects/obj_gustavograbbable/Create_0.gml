event_inherited();
//bumpable = false;
stompable = false;
killbyenemy = false;
groundpound = false;
instantkillable = false;
stunnable = false;
parryable = false;
hittable = false;
shakestun = false;
supertauntable = false;
grav = 0.5;
hsp = 0;
vsp = 0;
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
flash = false;

with obj_player1
{
	other.landspr = spr_lonegustavoidle;
	other.idlespr = spr_lonegustavograbbable;
	other.fallspr = spr_lonegustavojump;
	other.stunfallspr = spr_lonegustavostun;
	other.walkspr = spr_lonegustavowalk;
	other.turnspr = spr_lonegustavoidle;
	other.recoveryspr = spr_lonegustavoidle;
	other.grabbedspr = spr_lonegustavograbbable;
	other.scaredspr = spr_lonegustavograbbable;
	other.ragespr = spr_lonegustavograbbable;
	other.spr_dead = spr_lonegustavohurt;
	
	other.spr_palette = spr_palette;
	other.basepal = paletteselect;
}

image_xscale = -1;
hp = 1;
slapped = false;
grounded = true;
birdcreated = false;
boundbox = false;
important = true;
heavy = false;
depth = 0;

usepalette = true;
paletteselect = basepal;

sprite_index = spr_slimemove;
grabbedby = 0;
stuntouchbuffer = 0;
scaredbuffer = 0;
snotty = false;
sound_play_3d("event:/sfx/pep/jump", x, y);
