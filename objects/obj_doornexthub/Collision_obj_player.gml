var door = id;
var _actor = false;
with (obj_player)
{
	if (state == states.actor)
		_actor = true;
}
if (_actor)
	exit;
if (global.horse)
	exit;

if (!place_meeting(x, y, obj_doorblocked))
{
	with (other)
	{
		if (key_up && !instance_exists(obj_jumpscare) && grounded && (state == states.normal or state == states.ratmount or state == states.mach1 or state == states.mach2 or state == states.pogo or state == states.mach3 or state == states.Sjumpprep) && ((character != "M" && y == (other.y + 50)) or (character == "M" && y == (other.y + 55))) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
		{
			if other.sprite_index == spr_elevatoropen && other.unlocked
			{
				set_lastroom();
				sound_play("event:/sfx/misc/door");
				obj_camera.chargecamera = 0;
				add_saveroom();
				if (object_index == obj_player1)
					obj_player1.sprite_index = obj_player1.spr_lookdoor;
				if (object_index == obj_player2)
					obj_player2.sprite_index = obj_player2.spr_lookdoor;
				obj_player1.targetDoor = other.targetDoor;
				obj_player1.targetRoom = other.targetRoom2;
				obj_player2.targetDoor = other.targetDoor;
				obj_player2.targetRoom = other.targetRoom2;
				obj_player.image_index = 0;
				obj_player.state = states.door;
				obj_player.mach2 = 0;
				if (instance_exists(obj_player2) && global.coop == 1)
				{
					if (object_index == obj_player2)
					{
						obj_player1.x = obj_player2.x;
						obj_player1.y = obj_player2.y;
					}
					if (object_index == obj_player1)
					{
						obj_player2.x = obj_player1.x;
						obj_player2.y = obj_player1.y;
					}
				}
				other.visited = true;
				instance_create(x, y, obj_fadeout);
			
				if REMIX
				{
					smoothx = x - (door.x + 50);
					x = door.x + 50;
				}
			}
			else if REMIX && key_up2 && !door.key
			{
				if global.key_inv && !instance_exists(obj_transfotip)
				{
					with create_transformation_tip(lstr("wrongkey"))
						alarm[1] = 100;
					old_hud_message(string_upper(lstr("wrongkey")), 100);
				}
				
				sound_play_3d("event:/sfx/misc/keyunlock", x, y);
				instance_destroy(obj_keydoor_shake);
				
				with instance_create(door.x + 50, door.y + 50, obj_keydoor_shake)
				{
					sprite_index = spr_elevatorlocked_shake;
					depth = door.depth - 1;
				}
			}
		}
	}
}
