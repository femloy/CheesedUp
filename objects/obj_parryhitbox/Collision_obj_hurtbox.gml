if other.object_index == obj_spitcheesespike or other.object_index == obj_banditochicken_projectile or other.object_index == obj_robotknife
{
	with other
	{
		var current_hspd = abs(hsp);
		var _dir = sign(hsp);
		if x != other.x
			_dir = sign(x - other.x);
		hsp = _dir * current_hspd;
		image_xscale = _dir;
	}
}
if other.object_index == obj_forkhitbox
	obj_player.parryID = other.ID;

if REMIX && other.object_index == obj_pizzacutter2 && instance_exists(other.handleID)
{
	//var dir = sign(lerp(other.handleID.bbox_left, other.handleID.bbox_right, 0.5) - obj_player1.x);
	//if dir != 0
	//	obj_player1.xscale = dir;
	with other
	{
		if parry_timer > 0
			exit;
		
		handleID.spinspeed *= -1;
		sound_play_3d(sfx_killenemy, x, y);
		with instance_create(x, y, obj_sausageman_dead)
		{
			sprite_index = other.sprite_index;
			angle = other.image_angle;
			spinspeed = 5;
		}
		parry_timer = room_speed * 3;
	}
}

if !collisioned
{
	if obj_player1.x != other.x
		obj_player1.xscale = sign(other.x - obj_player1.x);
	else
		obj_player1.xscale = -other.image_xscale;
	event_user(0);
}
