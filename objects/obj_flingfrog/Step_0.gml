SS_CODE_START;

// Search Player and gravitate towards it
var _player = instance_nearest(x, y, obj_player);
if grabbedPlayer <= noone
{
	if distance_to_object(_player) < 100
	{
		var _player_dir = point_direction(xstart, ystart, _player.x, _player.y);
		targetX = lengthdir_x(90, _player_dir);
		targetY = lengthdir_y(90, _player_dir);
		hsp = 0;
		vsp = 0;		
		if isReady
		{
			x = round(xstart + targetX);
			y = round(max(ystart + targetY, ystart));
		}
		else
		{
			x = round(lerp(x, xstart + targetX, 0.20));
			y = round(lerp(y, ystart + targetY, 0.20));		
			if x = round(xstart + targetX) && y = round(ystart + targetY)
				isReady = true;
		}
	}
	else 
	{
		isReady = false;
		x = round(lerp(x, xstart, 0.20));
		y = round(lerp(y, ystart + 70, 0.20));
	}
}

// Grab Player
if place_meeting(x, y, _player) && !scr_solid(x, y) && _player.vsp >= -3 && _player.state != states.removed_state && grabbedPlayer <= noone && waitTimer <= 0
{
	grabbedPlayer = _player;
	old_hsp = grabbedPlayer.hsp / 4;
	hsp = old_hsp;
	vsp = clamp(grabbedPlayer.vsp / 2 + 10, 5, 20);
	max_vsp = -15;
	
	with grabbedPlayer
	{
		if !instance_exists(obj_genericpoofeffect)
		{
			with instance_create(x, y, obj_genericpoofeffect)
				sprite_index = spr_candyifiedeffect1;
			sound_play_3d("event:/modded/sfx/bloop", x, y);
		}
		
		movespeed = abs(movespeed);
		sprite_index = spr_player_candybegin;
		state = states.removed_state;
		hsp = 0;
		vsp = 0;
		x = other.x;
		y = other.y;
	}
}

if grabbedPlayer != noone
{
	// Move Around	
	with (grabbedPlayer)
	{
		x = other.x;
		y = other.y;
		
		if !instance_exists(obj_customeffect)
		{
			// I got lazy sorry
			with instance_create(x, y, obj_customeffect)
			{
				sprite_index = spr_candyifiedeffect2;
				playerid = other.id;
				loop = true;
				followplayer = true;
				
				step = function()
				{
					if playerid.state != states.removed_state
						instance_destroy();
				}
			}
		}
		
		move = (key_left + key_right);
		hsp = (move * movespeed);
	
		if move != 0 && !scr_solid(x + move, y)
		{
			xscale = move;
			if movespeed < 6
				movespeed += 0.25;
		}
		else
			movespeed = 0;		
	}
	
	old_hsp = Approach(old_hsp, 0, 0.20);
	hsp = old_hsp + grabbedPlayer.hsp;
	
	// Bump into wall
	if scr_solid(x + sign(hsp),y)
	{
		old_hsp = -sign(hsp) * 3;
		grabbedPlayer.movespeed /= 2;
	}	
	if scr_solid(x , y + 1) && vsp >= 0
		vsp -= 5
	
	if vsp >= 0 // ???
		vsp -= 0.65;
	else if vsp < 15
		vsp -= 1;
	x = clamp(x, xstart - 280, xstart + 280);
	
	//Translate to Tongue
	if (x >= xstart + 200 || x <= xstart - 200) || (xprevious - x == 0 && yprevious - y == 0)
		farBuffer++
	else
		farBuffer = 0;
	
	// Release
	if grabbedPlayer.y <= ystart && vsp < 0
	{
		with (grabbedPlayer)
		{
			sound_play_3d("event:/modded/sfx/bloop2", x, y);
			state = states.jump
			jumpstop = true;
			hsp = other.hsp;
			movespeed = abs(hsp);
			vsp = other.max_vsp;
			jumpAnim = false;
			sprite_index = spr_player_candytransitionup;
			if sign(hsp) != 0
				xscale = sign(hsp);
			if REMIX
				instance_create(x, y, obj_speedlinesup);
		}
		grabbedPlayer = noone;
		waitTimer = 25;	
	}
	
	// Cancel
	else if grabbedPlayer.key_jump || farBuffer >= 100
	{ 
		with (grabbedPlayer)
		{
			sound_play_3d("event:/modded/sfx/bloop2", x, y);
			state = states.jump
			jumpstop = true;
			hsp = other.hsp;
			movespeed = abs(hsp);
			vsp = -6;
			jumpAnim = false;
			sprite_index = spr_player_candytransitionup;
			if sign(hsp) != 0
				xscale = sign(hsp);
		}
		grabbedPlayer = noone;
		waitTimer = 25;	
	}	
}

if waitTimer > 0
	waitTimer--;
	
candyindex += 0.35;

SS_CODE_END;
