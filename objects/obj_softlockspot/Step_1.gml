live_auto_call;

switch state
{
	case 0:
		if condition()
			state = 1;
		break;
	
	case 1:
		with obj_camera
			lock = true;
		with player
		{
			tauntstoredindex = image_index;
			tauntstoredsprite = sprite_index;
			tauntstoredstate = state;
			tauntstoredmovespeed = movespeed;
			tauntstoredhsp = hsp;
			tauntstoredvsp = vsp;
			state = states.actor;
			hsp = 0;
			vsp = 0;
			other.storedimagespeed = image_speed;
			image_speed = 0;
		}
		state = 2;
		handy = CAMY - 200;
		fmod_event_instance_play(snd);
		visible = true;
		instance_destroy(obj_itspizzatime);
		instance_destroy(obj_fadeout);
		break;
	
	case 2:
		handx = player.x;
		handy = Approach(handy, player.y, 12);
		
		if handy >= player.y - 25
		{
			sound_play_3d("event:/sfx/pep/bumpwall", x, y);
			with instance_create(player.x, player.y - 5, obj_parryeffect)
			{
				image_yscale = -1;
				sprite_index = spr_grabhangeffect;
				image_speed = 0.35;
			}
			player.sprite_index = player.spr_catched;
			player.image_speed = 0.35;
			state = 3;
		}
		break;
	
	case 3:
		var targety = CAMY - 200;
		handy = Approach(handy, targety, 12);
		
		with player
		{
			hsp = 0;
			vsp = 0;
			
			x = other.handx;
			y = other.handy;
		}
		
		if handy <= targety
		{
			with obj_camera
			{
				var yo = IT_camera_yoffset();
				
				camx = clamp(other.target.x - CAMW / 2, 0, room_width - CAMW);
				camy = clamp(other.target.y - CAMH / 2 + yo, 0, room_height - CAMH);
				camera_set_view_pos(view_camera[0], camx, camy);
				
				lockx = camx;
				locky = camy;
			}
			handx = target.x;
			state = 4;
		}
		break;
	
	case 4:
		handx = target.x;
		handy = Approach(handy, target.y, 12);
		
		with player
		{
			hsp = 0;
			vsp = 0;
			
			x = other.handx;
			y = other.handy;
		}
		
		if handy >= target.y
		{
			with obj_camera
				lock = false;
			with player
			{
				sound_play_3d("event:/sfx/enemies/projectile", x, y);
				state = tauntstoredstate;
				hsp = tauntstoredhsp;
				vsp = tauntstoredvsp;
				movespeed = tauntstoredmovespeed;
				image_index = tauntstoredindex;
				sprite_index = tauntstoredsprite;
				image_speed = other.storedimagespeed;
				
				if state == states.door or state == states.backbreaker or state == states.chainsaw
					state = states.normal;
			}
			state = 5;
		}
		break;
	
	case 5:
		handy = Approach(handy, -150, 8);
		if handy <= -150
		{
			fmod_event_instance_stop(snd, false);
			state = 0;
		}
		break;
}
if state > 0
{
	if player.state == states.actor
		global.combotimepause = 2;
	fmod_event_instance_set_3d_attributes(snd, handx, handy);
}
