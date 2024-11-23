if deactivate
{
	if hitboxcreate
	{
		with obj_forkhitbox
		{
			if ID == other.id
				instance_destroy();
		}
	}
	
	x = room_width / 2;
	y = -100;
	
	hitboxcreate = false;
	visible = false;
	
	exit;
}

if !knocked
{
	var target = instance_nearest(x, y, obj_player);
	if target
	{
		// follow player
		var spd = maxspeed;
		if global.in_afom
			spd = 4;
		else if global.in_cyop
			spd = 1;
		else if !bbox_in_camera(view_camera[0], 50)
			spd *= 1.25;
		
		x = Approach(x, target.x, spd);
		y = Approach(y, target.y, spd);
		if x != target.x
			image_xscale = -sign(x - target.x);
	
		// parry
		if target.state == states.parry && distance_to_object(target) < 50 && alarm[0] == -1
		{
			alarm[0] = 10;
			knocked = true;
			
			var dir = point_direction(x, y, target.x, target.y);
			hspeed = -lengthdir_x(16, dir);
			vspeed = -lengthdir_y(16, dir);
		}
	}
}
else 
{
	image_angle -= ((hspeed + vspeed) / 2) * 4;
	with instance_place(x, y, obj_baddie)
	{
		if object_index != obj_pizzaballOLD
			instance_destroy();
	}
}

if global.snickrematch && object_index == obj_snickexe
{
	sprite_index = spr_snick_rexe;
	with obj_player1
		if character == "S" other.sprite_index = spr_snick_exi;
	maxspeed = 2.75;
	
	if room == dungeon_10 or room == dungeon_9 or room == snick_challengeend
		maxspeed = 3.25;
}

// hurtbox
var killable = (obj_player1.instakillmove or obj_player1.state == states.handstandjump or obj_player.state == states.punch or obj_player1.state == states.climbwall or obj_player1.state == states.mach2);
if (!hitboxcreate && !killable)
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_forkhitbox))
	{
		sprite_index = other.sprite_index;
		ID = other.id;
	}
}

// spontaneously evaporate if player is in cutscene
if (place_meeting(x, y, obj_player1) && killable)
or (obj_player1.state == states.keyget or obj_player1.state == states.victory or obj_player1.state == states.frozen) or place_meeting(x, y, obj_playerexplosion) or place_meeting(x, y, obj_dynamiteexplosion)
or safe_get(obj_pizzagoblinbomb, "state") == states.grabbed
&& !deactivate
	reset_pos();

// aftarimages
if --after <= 0
{
	after = 5;
	create_red_afterimage(x, y, sprite_index, image_index, image_xscale);
}
