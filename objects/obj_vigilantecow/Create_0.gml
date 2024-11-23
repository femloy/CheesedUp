spd = 6;
hsp = 0;
vsp = 0;
grav = 0.5;
image_index = 0;
image_speed = 0.35;
bounce = 0;
xscale = image_xscale;
mask_index = spr_cowbounce;
bullethit = 3;
flash = false;
flashbuffer = 0;
sound_play_3d("event:/sfx/vigilante/cowstomp", x, y);

snotty = instance_exists(obj_vigilanteboss) && obj_vigilanteboss.snotty;
spr = spr_cowidle;
bouncespr = spr_cowbounce;
debris = spr_cowmeat;
sfx = "event:/sfx/vigilante/cowdead";
if snotty 
{
	spr = spr_donkeyidle;
	bouncespr = spr_donkeybounce;	
	debris = spr_donkeymeat;
	sfx = "event:/modded/sfx/donkeydead"
}
sprite_index = spr;
