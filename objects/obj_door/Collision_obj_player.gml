if locked
	exit;

var _actor = false;
var door = id;
with other
{
	if state == states.actor
		_actor = true;
}
if _actor
	exit;
if global.horse
	exit;
if john && global.panic
	exit;

if !place_meeting(x, y, obj_doorblocked)
{
	with other
	{
		if key_up && !instance_exists(obj_jumpscare) && grounded && (((state == states.ratmount or state == states.ratmountbounce || state == states.noisecrusher) && brick) or state == states.normal or state == states.mach1 or state == states.mach2 or state == states.pogo or state == states.mach3 or state == states.Sjumpprep) && (y == (other.y + 50) or global.in_afom) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor
		{
			if !instance_exists(obj_cyop_loader)
			{
				if room == tower_5 || other.object_index == obj_pumpkindoor
				{
					if other.object_index == obj_pumpkindoor
					{
						notification_push(notifs.trickytreat_enter, [room]);
						global.levelreset = true;
					}
					backtohubroom = room;
					backtohubstartx = x;
					backtohubstarty = y;
				}
				if room == trickytreat_1
				{
					reset_modifier();
					notification_push(notifs.trickytreat_leave, [room]);	
				}
			}
			sound_play("event:/sfx/misc/door");
			obj_camera.chargecamera = 0;
			add_saveroom();
			
			if isgustavo
				sprite_index = spr_ratmountenterdoor;
			else
				sprite_index = obj_player1.spr_lookdoor;
			
			if REMIX
			{
				smoothx = x - (door.x + door.sprite_width / 2);
				x = door.x + door.sprite_width / 2;
			}
			
			set_lastroom();
			targetDoor = door.targetDoor;
			targetRoom = door.targetRoom;
			
			image_index = 0;
			if state != states.gotoplayer
				state = states.door;
			mach2 = 0;
				
			if door.compatibility
			{
				oldHallway = true;
				player_x = door.target_x;
				player_y = door.target_y;
			}
			
			other.visited = true;
			if other.old
				other.sprite_index = other.spr_visited;
			
			if !in_saveroom(other.id)
				add_saveroom(other.id);
			with instance_create(x, y, obj_fadeout)
			{
				offload_arr = door.offload_arr;
				group_arr = door.group_arr;
			}
		}
	}
}
