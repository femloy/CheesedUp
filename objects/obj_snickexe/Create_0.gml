maxspeed = 2;
hitboxcreate = false;
image_speed = 0.35;
depth = -5;

reset_pos = function(particle = true)
{
	if y > -50 && y < room_height + 50 && particle
		create_particle(x, y, part.genericpoofeffect);
	
	if global.snickrematch && event_type != ev_other && object_index != obj_snickexe
	{
		deactivate = true;
		alarm[1] = room_speed * 5;
	}
	
	knocked = false;
	hspeed = 0;
	vspeed = 0;
	image_angle = 0;
	x = room_width / 2;
	y = -50;
	hitboxcreate = false;
	maxspeed = 2;
	
	if check_lap_mode(lapmodes.laphell) && global.laps >= 2
		maxspeed = 4;
	
	if room == ruin_4 or room == ruin_7
	or room == ruin_4_OLD or room == ruin_7_OLD
		y = room_height + 50;
}

// pto
knocked = false;
enemybird = false;
enemybirdi = 0;
after = 0;
deactivate = false;

if object_index == obj_snickexe && !instance_exists(obj_cyop_loader)
&& !MOD.EasyMode
{
	if SUGARY
		sprite_index = spr_yogurtexe;
	
	create_transformation_tip(embed_value_string(lstr("snickiscoming"), [SUGARY ? "Yogurt" : "Snick"]));
}
