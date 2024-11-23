SS_CODE_START;

if (state != states.hit)
	invtime = Approach(invtime, 0, 1)

if (obj_player1.baddiegrabbedID != id && state == states.grabbed)
	state = states.idle
if (type = "Heavy" && !grounded)
	vsp += 0.2

if y > room_height + 200
{
	state = states.idle	
	x = xstart
	y = ystart
	hsp = 0
	vsp = 0
}

if (type == "Normal" || type == "Heavy") && ((state == states.idle && type == "Heavy") || state == states.stun)
{
	instance_destroy(instance_place(x + hsp, y + vsp, obj_baddie))
	instance_destroy(instance_place(x + sign(hsp), y + sign(vsp), obj_baddie))
	instance_destroy(instance_place(x + hsp, y + vsp, obj_destructibles))
	instance_destroy(instance_place(x + sign(hsp), y + sign(vsp), obj_destructibles))
	
	with obj_icewall
	{
		if place_meeting(x - other.hsp, y - other.vsp, other)
			instance_destroy();
		else if distance_to_object(other) <= 1
			instance_destroy();
	}
}

switch state
{
	case states.idle:
		thrown = false
		grav = 0.5
		if (grounded)
			hsp = Approach(hsp, 0, 0.3)
		scr_collide()
	break
	
	case states.stun:
		//hsp = (xscale * movespeed)
		if type == "Fragile" && scr_solid(x + hsp, y + vsp)
			instance_destroy();
		grav = 0.5
		if grounded && vsp > 0
			state = states.idle
		scr_collide()
	break
	
	case states.hit:
		hp = 999;
		scr_enemy_hit()
	break

}
if (flash == 1 && alarm[1] <= 0)
	alarm[1] = (0.15 * room_speed)

if !place_meeting(x, y, obj_dashpad)
	touching = false;

var _pad = instance_place(x, y, obj_dashpad)
if state != states.hit && _pad && state != states.grabbed && !touching
{
	if !dashpadbuffer
		sound_play_3d("event:/sfx/misc/dashpad", x, y);
	dashpadbuffer = true;
	
	state = states.stun
	vsp = -7
	x = _pad.x 
	y = _pad.y
	xscale = _pad.image_xscale
	movespeed = 15
	other.hsp = (other.movespeed * other.xscale)
	other.flash = true;
	touching = true;
}
else
	dashpadbuffer = false;

if state != states.hit && invtime <= 0 && place_meeting(x, y, obj_player1) && state != states.grabbed 
{
	with (obj_player1)
	{
		if state == states.mach3 || (state == states.mach2 && sprite_index != spr_mach1) || state == states.rocket
		or check_kungfu_state() or (state == states.handstandjump && instakillmove) or (state == states.ratmount && (abs(hsp) >= 12) || state == states.ratmountpunch)
		{
			repeat 3
				create_slapstar(other.x, other.y);
            //instance_create(other.x, other.y, obj_baddiegibs);
			instance_create(other.x, other.y, obj_bangeffect);
			instance_create(other.x, other.y, obj_parryeffect)
			machpunchAnim = true;
			other.state = states.stun
			other.vsp = -11
			if state == states.mach2
				other.vsp = -7
			
			other.movespeed = movespeed + 2
			if state == states.rocket
			{
				other.vsp -= 7
				other.movespeed += 2
			}
			
			other.xscale = xscale;
			other.hsp = (abs(other.movespeed) * other.xscale);
			other.flash = true;
			other.invtime = 10;
			sound_play_3d(sfx_punch, x, y);
			
			with other
				lag();
		}
		else if state == states.Sjump || state == states.punch
		{
			var pctg = other.x - x
			repeat 3
				create_slapstar(other.x, other.y);
	        //instance_create(other.x, other.y, obj_baddiegibs);
			instance_create(other.x, other.y, obj_bangeffect);
			instance_create(other.x, other.y, obj_parryeffect)
			machpunchAnim = true;
			other.state = states.stun
			other.vsp = vsp
			if state == states.Sjump
				other.vsp -= 8
			other.movespeed = 7 * (abs(pctg) / 32)
			if sign(pctg) != 0
				other.xscale = sign(pctg)
			else	
				other.movespeed = 0
			
			other.hsp = (other.movespeed * other.xscale)
			if state == states.Sjump
				other.hsp = 0;
			
			other.flash = true;
			other.invtime = 20
			sound_play_3d(sfx_punch, x, y);
			
			with other
				lag();
		}
		
		if state == states.handstandjump 
		{
			//scr_sound(sound_slaphit);
			grabbedby = 1;
			baddiegrabbedID = other.id
			with (other) 
			{
				state = states.grabbed
				instance_create(x + (other.xscale * 40), y, obj_punchdust)
			}				
			if !key_up 
			{
				state = states.grab;
				sprite_index = spr_haulingstart;
				image_index = 0;
			}
			else 
			{
				state = states.superslam;
				sprite_index = spr_piledriver;
				if grounded
					vsp = -12;
				else
					vsp = -6;
				grounded = false;
				image_index = 0;
				image_speed = 0.35;	
			}
		}
	}
}

SS_CODE_END;
