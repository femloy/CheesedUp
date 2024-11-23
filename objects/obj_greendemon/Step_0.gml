live_auto_call;

/*if keyboard_check_pressed(ord("R"))
{
	instance_create(obj_player.x, obj_player.y, obj_greendemon);
	instance_destroy(obj_bossplayerdeath);
	obj_player.state = 0;
	state = 0;
	t = 0;
	instance_destroy();
}*/

if state == 2
{
	sprite_index = -1;
	if !instance_exists(obj_genericdeath)
		instance_create(0, 0, obj_genericdeath);
	exit;
}

if (obj_player1.cutscene && obj_player1.state != states.chainsaw && obj_player1.state != states.door)
or obj_player1.sprite_index == obj_player1.spr_shotgunpullout or obj_player1.state == states.taxi
or obj_player1.state == states.teleport or obj_player1.state == states.animation or obj_player1.state == states.actor
or obj_player1.state == states.johnghost
{
	if state != 0
	{
		xstart = x;
		ystart = y;
	}
	state = 0;
	t = 40;
}

switch state
{
	case -1:
		x = obj_player1.x;
		y = obj_player1.y;
		xstart = x;
		ystart = y;
		
		t = 40;
		state = 0;
		break;
	
	case 0:
		spd = 0;
		hspeed = 0;
		vspeed = 0;
		
		x = xstart - cos(current_time / 80) * 32;
		y = ystart + sin(current_time / 80) * 32;
		
		if --particle <= 0
		{
			particle = 1;
			create_particle(xstart, ystart, part.keyparticles, 32);
		}
		
		if ++t >= 80
		{
			/*
			hspeed = (x - xprevious);
			vspeed = (y - yprevious);
			*/
			state = 1;
		}
		break;
	
	case 1:
		if --particle <= 0
		{
			particle = 6;
			create_red_afterimage(x, y, sprite_index, 0, 1);
		}
		
		var actual_spd = bbox_in_camera(, 64) ? 6 : max(abs(obj_player1.movespeed), 10);
		with obj_player
		{
			if !scr_transformationcheck()
				actual_spd = 4;
		}
		
		spd = Approach(spd, 6, 0.01);
		
		hspeed = Approach(hspeed, lengthdir_x(actual_spd, point_direction(x, y, obj_player1.x, obj_player1.y)), spd);
		vspeed = Approach(vspeed, lengthdir_y(actual_spd, point_direction(x, y, obj_player1.x, obj_player1.y)), spd);
		
		var player = instance_place(x, y, obj_player);
		if player && player.state != states.door && !instance_exists(obj_fadeout)
		{
			state = 2;
			sound_play("event:/modded/sfx/greendemonget");
		}
		break;
}
sprite_index = spr_oneup;

if state == 0
{
	fmod_event_instance_set_parameter(startsnd, "state", 0, true);
	sound_instance_move(startsnd, x, y);
	
	if !fmod_event_instance_is_playing(startsnd)
		fmod_event_instance_play(startsnd);
}
else
	fmod_event_instance_set_parameter(startsnd, "state", 1, true);
