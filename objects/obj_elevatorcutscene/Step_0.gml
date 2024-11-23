live_auto_call;

if !start
{
	if room == tower_1
	{
		start = true;
		with obj_hubelevator
		{
			other.elevator_x = x;
			other.elevator_y = y;
			other.target_x = x + 50;
			other.target_y = y + 50;
		}
	}
	else
		exit;
}

if con == 0
{
	fade = Approach(fade, 0, 0.01);
	if music != noone
		fmod_event_instance_set_volume(music, fade);
	
	target_time = lerp(target_time, 1, target_time / 20 + 0.01);
	x = lerp(target_x - 1000, target_x, target_time);
	y = target_y;
	
	if target_time >= 0.99
	{
		con_time++;
		if con_time >= 30
		{
			with obj_hubelevator
			{
				shake_camera(4);
				instance_create(x + 50, y + 52, obj_canonexplosion);
				y = 0;
				vsp = 0;
				depth = -10;
			}
			con = 1;
			con_time = 0;
		}
	}
}

if con == 1
{
	with obj_hubelevator
	{
		vsp += 0.5;
		y += vsp;
		
		if y >= ystart
		{
			y = ystart;
			depth = 0;
			
			create_particle(x + 50, y + 52 - 3, part.landcloud);
			create_particle(x + 50, y + 52, part.groundpoundeffect);
			
			shake_camera(8, 10 / room_speed);
			sound_play_3d(sfx_groundpound, x, y);
			sound_play_3d(sfx_breakmetal, x, y);
			sound_play_3d(sfx_cheers, x, y);
			
			vsp = -12;
			other.con = 2;
		}
	}
}
else if con == 2
{
	with obj_hubelevator
	{
		vsp += 0.5;
		y += vsp;
		
		if y > ystart
		{
			y = ystart;
			sound_play_3d(sfx_step, x, y);
			
			other.con = 3;
		}
	}
}

if con == 3
{
	if con_time++ >= 60
		fade = Approach(fade, 2, 0.01);
	if fade >= 1.4
	{
		instance_destroy();
		room_goto(Realtitlescreen);
	}
}

with obj_hubelevator
	visible = other.con != 0;
with obj_pigtotal
	instance_destroy();
with obj_toppinprop
	instance_destroy();
with obj_startgate_secreteye
	instance_destroy();
with obj_tutorialbook
	instance_destroy();
with obj_roomname
{
	yi = -50;
	showtext = false;
}
