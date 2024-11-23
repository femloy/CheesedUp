live_auto_call;

stop_music();
instance_destroy(obj_hard);

depth = -200;

player = obj_player1;
boss = obj_vigilanteboss;
donkey = instance_create(-1200, 402, obj_hard);
screamed = false;

var dis = 264;
with player
{
	sprite_index = spr_playerV_revolverhold;
	image_speed = 0.35;
	
	hsp = 0;
	vsp = 0;
	xscale = 1;
	x = dis;
	y = 402;
}
with boss
{
	elitehit = 1;
	sprite_index = spr_playerV_revolverhold;
	image_speed = 0.35;
	
	hsp = 0;
	vsp = 0;
	image_xscale = -1;
	x = room_width - dis;
	y = 402;
}
with obj_bosscontroller
{
	image_alpha = 1;
	boss_hp = 1;
	boss_prevhp = 1;
	ds_list_clear(particlelist);
}

with donkey
{
	image_speed = 0.35;
	sprite_index = spr_icecreamtruck;
	hspeed = 5;
	depth = layer_get_depth("Backgrounds_Ring") + 1;
}

con = 0;
t = 80;

fade = 0;
shake = 4;
