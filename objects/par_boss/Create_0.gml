scr_initenemy();
mach3destroy = false;
init_collision();
thrown = false;
depth = obj_drawcontroller.depth + 1;
movespeed = 0;
state = states.normal;
team = 1;
important = true;
mach3destroy = false;
jugglecount = 0;
max_hp = 400;
hp = 0;
invincible = false;
inv_timer = -1;
inv_max = 25;
player_hurtstates = ds_map_create();
boss_hurtstates = ds_map_create();
boss_unparryablestates = ds_map_create();
destroyable = false;
stuntouchbuffer = 0;
lungehurt = true;
hitLag = 0;
hitX = x;
hitY = y;
hithsp = 0;
hitvsp = 0;
hitstate = states.normal;
stunfallspr = sprite_index;
walkspr = sprite_index;
spr_dead = sprite_index;
fallspr = sprite_index;
bumpspr = sprite_index;
parryspr = sprite_index;
defeatplayerspr = sprite_index;
lastplayerid = obj_player1.id;
attacking = false;
destroyed = false;
playerdestroyed = false;
colliding = true;

function SUPER_player_destroy(argument0)
{
	depth = argument0.depth;
	playerdestroyed = true;
	with (argument0)
	{
		camera_zoom(1, 0.1);
		var lag = room_speed * 3;
		other.hitLag = lag;
		other.hitX = room_width / 2;
		other.hitY = room_height / 2;
		other.x = other.hitX;
		other.y = other.hitY;
		other.state = states.chainsaw;
		other.hitstate = states.arenaround;
		other.hitvsp = -4;
		other.hithsp = -other.image_xscale * 8;
		hitLag = lag;
		hitX = (room_width / 2) + (other.image_xscale * 16);
		hitY = (room_height / 2) - 5;
		x = hitX;
		y = hitY;
		xscale = -other.image_xscale;
		hitxscale = -other.image_xscale;
		sprite_index = spr_player_outofpizza1;
		hithsp = 15;
		hitstunned = 10000;
		hitvsp = -8;
		state = states.hit;
		instance_create(other.x, other.y, obj_parryeffect);
		shake_camera(3, 3 / room_speed);
	}
}
function SUPER_boss_destroy(argument0)
{
	destroyed = true;
	depth = argument0.depth;
	//global.attackstyle = 0;
	global.savedattackstyle = 0;
	with (argument0)
	{
		camera_zoom(1, 0.1);
		if (state == states.fistmatch || state == states.superattack || state == states.parry || state == states.backbreaker)
		{
			sprite_index = spr_attackdash;
			image_index = 6;
			state = states.handstandjump;
		}
		if (state != states.chainsaw)
		{
			tauntstoredmovespeed = movespeed;
			tauntstoredsprite = sprite_index;
			tauntstoredstate = state;
		}
		var lag = room_speed * 3;
		other.image_xscale = -xscale;
		other.hitLag = lag;
		other.hitX = (room_width / 2) + (xscale * 16);
		other.hitY = (room_height / 2) - 5;
		other.x = other.hitX;
		other.y = other.hitY;
		other.hitvsp = -8;
		other.hithsp = -other.image_xscale * 15;
		other.state = states.hit;
		other.thrown = true;
		other.destroyable = true;
		other.colliding = true;
		other.grounded = false;
		hitLag = lag;
		hitX = room_width / 2;
		hitY = room_height / 2;
		x = hitX;
		y = hitY;
		state = states.chainsaw;
		instance_create(other.x, other.y, obj_parryeffect);
		create_slapstar(x, y);
		create_slapstar(x, y);
		create_slapstar(x, y);
		create_baddiegibs(x, y);
		create_baddiegibs(x, y);
		create_baddiegibs(x, y);
		shake_camera(3, 3 / room_speed);
	}
}
function SUPER_boss_hurt(argument0, argument1)
{
	if (important)
		hp -= argument0;
	if (argument1.state != states.playersuperattack)
	{
		with (obj_bosscontroller)
			super += 30;
	}
	with (argument1)
	{
		var atstate = state;
		if (state == states.handstandjump)
		{
			state = states.finishingblow;
			sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5);
			image_index = 6;
		}
		if (state != states.chainsaw)
		{
			tauntstoredmovespeed = movespeed;
			tauntstoredsprite = sprite_index;
			tauntstoredstate = state;
		}
		state = states.chainsaw;
		var lag = 8;
		hitLag = lag;
		hitX = x;
		hitY = y;
		if (state == states.chainsaw || state == states.hit)
		{
			x = hitX;
			y = hitY;
		}
		if (other.state == states.hit || other.state == states.chainsaw)
		{
			other.x = other.hitX;
			other.y = other.hitY;
		}
		other.image_xscale = -xscale;
		other.hitLag = lag;
		other.hitX = other.x;
		other.hitY = other.y;
		other.jugglecount++;
		other.hitvsp = -9;
		other.movespeed = 7 + (other.jugglecount * 2);
		if (atstate == states.parry)
		{
			other.hitvsp = -14;
			other.movespeed = 0;
		}
		other.hithsp = -other.image_xscale * other.movespeed;
		other.state = states.hit;
		instance_create(other.x, other.y, obj_parryeffect);
		create_slapstar(x, y);
		create_slapstar(x, y);
		create_slapstar(x, y);
		create_baddiegibs(x, y);
		create_baddiegibs(x, y);
		create_baddiegibs(x, y);
		shake_camera(3, 3 / room_speed);
	}
}
function SUPER_boss_hurt_noplayer(argument0)
{
	if (important)
		hp -= argument0;
	if (obj_player.state != states.playersuperattack)
	{
		with (obj_bosscontroller)
			super += 30;
	}
	var lag = 8;
	if (state == states.hit || state == states.chainsaw)
	{
		x = hitX;
		y = hitY;
	}
	image_xscale = -other.image_xscale;
	hitLag = lag;
	hitX = x;
	hitY = y;
	hitvsp = -8;
	hithsp = other.image_xscale * 15;
	state = states.hit;
	instance_create(x, y, obj_parryeffect);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	shake_camera(3, 3 / room_speed);
}
function SUPER_player_hurt(argument0, argument1)
{
	if (instance_exists(obj_bosscontroller))
		obj_bosscontroller.player_hp -= argument0;
	with (obj_bosscontroller)
		super += 80;
	with (argument1)
	{
		var lag = 8;
		if (state == states.hit || state == states.chainsaw)
		{
			x = hitX;
			y = hitY;
		}
		if (other.state == states.chainsaw || other.state == states.hit)
		{
			other.x = other.hitX;
			other.y = other.hitY;
		}
		other.hitLag = lag;
		other.hitX = other.x;
		other.hitY = other.y;
		other.state = states.chainsaw;
		hitLag = lag;
		hitX = x;
		hitY = y;
		xscale = (x != other.x) ? sign(other.x - x) : -other.image_xscale;
		hitxscale = (x != other.x) ? sign(other.x - x) : -other.image_xscale;
		sprite_index = spr_hurt;
		hithsp = 15;
		if (hitstunned > 0)
		{
			hitstunned -= 50;
			if (hitstunned <= 0)
				hitstunned = 1;
		}
		else
			hitstunned = 100;
		hitvsp = -8;
		state = states.hit;
		instance_create(other.x, other.y, obj_parryeffect);
		create_slapstar(x, y);
		create_slapstar(x, y);
		create_baddiegibs(x, y);
		create_baddiegibs(x, y);
		shake_camera(3, 3 / room_speed);
	}
}
function player_destroy(argument0)
{
	SUPER_player_destroy(argument0);
}
function boss_destroy(argument0)
{
	SUPER_boss_destroy(argument0);
}
function player_hurt(argument0, argument1)
{
	SUPER_player_hurt(argument0, argument1);
}
function boss_hurt(argument0, argument1)
{
	SUPER_boss_hurt(argument0, argument1);
}
function boss_hurt_noplayer(argument0)
{
	SUPER_boss_hurt_noplayer(argument0);
}
