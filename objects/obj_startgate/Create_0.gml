sprite_index = gateSprite;
depth = 100;
image_speed = 0;
world = 1;
pizza = false;
rank = "d";
group_arr = noone;
boss = false;
drawing = false;
highscore = 0;
secret_count = 0;
toppin = array_create(5, 0);
scr_hub_bg_init();
msg = "";
locked = false;

// pto
highscore = 0;
laps = 0;
hats = 0;
secret_count = 0;
toppin = [0, 0, 0, 0, 0];
rank = "d";
timed_rank = "";
transfotip = noone;

// cyop
levelName = "";
if level == "none" or level == "noone" or level == ""
	level = noone;

if SUGARY_SPIRE
{
	info = noone;
	confecti_sprs[0] = { sprite: spr_marshmellow_taunt, image: choose(0, 1) };
	confecti_sprs[1] = { sprite: spr_chocolate_taunt, image: choose(0, 1) };
	confecti_sprs[2] = { sprite: spr_crack_taunt, image: choose(0, 1) };
	confecti_sprs[3] = { sprite: spr_gummyworm_taunt, image: choose(0, 1) };
	confecti_sprs[4] = { sprite: spr_candy_taunt, image: choose(0, 1) };
}
