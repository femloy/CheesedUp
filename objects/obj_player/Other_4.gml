ensure_order;

if room == timesuproom
{
	scale_xs = 1;
	scale_ys = 1;
	xscale = 1;
	visible = true;
}

savedhallwaydirection = hallwaydirection;
savedhallway = hallway;
savedvhallwaydirection = vhallwaydirection;
savedverticalhallway = verticalhallway;

if room != boss_noise
{
	global.resetdoise = false;
	resetdoisecount = 0;
}

if global.swapmode && !instance_exists(obj_swapmodefollow)
	swap_create();

with obj_secretportal
{
	if secret
	{
		if room != tower_soundtest && !instance_exists(obj_ghostcollectibles)
		{
			if !instance_exists(obj_ghostcollectibles)
			{
				if !instance_exists(obj_randomsecret)
					instance_create(0, 0, obj_secretfound);
				instance_create(0, 0, obj_ghostcollectibles);
			}
		}
	}
}
if !is_bossroom()
	hitstunned = 0;
if global.levelreset
{
	scr_playerreset(true);
	global.levelreset = false;
	instance_destroy(obj_comboend);
	instance_destroy(obj_combotitle);
	global.combodropped = false;
}
if room == tower_finalhallway && targetDoor == "C" && state == states.comingoutdoor
	state = states.normal;
if global.levelcomplete
{
	global.levelcomplete = false;
	global.leveltorestart = noone;
	global.leveltosave = noone;
	global.startgate = false;
}
if state == states.comingoutdoor && global.coop == 1 && !place_meeting(x, y, obj_exitgate)
{
	if object_index == obj_player1 && obj_player1.spotlight == 0
		visible = false;
	if object_index == obj_player2 && obj_player1.spotlight == 1
		visible = false;
}
if global.coop == 1
{
	scr_changetoppings();
	if !instance_exists(obj_cooppointer)
		instance_create(x, y, obj_cooppointer);
	if !instance_exists(obj_coopflag)
		instance_create(x, y, obj_coopflag);
}
if state == states.grab && !REMIX
	state = states.normal;
if place_meeting(x, y, obj_boxofpizza) || place_meeting(x, y - 1, obj_boxofpizza)
{
	box = true;
	hallway = false;
	state = states.crouch;
	if isgustavo
		state = states.ratmountcrouch;
	if character == "S"
		state = states.normal;
}
if object_index != obj_player2 or global.coop
{
	var door_obj = noone;
	switch targetDoor
	{
		case "A": door_obj = obj_doorA; break;
		case "B": door_obj = obj_doorB; break;
		case "C": door_obj = obj_doorC; break;
		case "D": door_obj = obj_doorD; break;
		case "E": door_obj = obj_doorE; break;
		case "F": door_obj = obj_doorF; break;
		case "G": door_obj = obj_doorG; break;
		default:
			with obj_doorX
			{
				if self[$ "door"] == other.targetDoor
				{
					door_obj = self;
					break;
				}
			}
	}
	if instance_exists(door_obj)
	{
		with door_obj
		{
			with instance_place(x, y, obj_door)
				event_user(0);
		}
		
		if hallway && !global.in_cyop
			x = door_obj.x + (hallwaydirection * 100);
		else if box
			x = door_obj.x + 32;
		else
			x = door_obj.x + 16 + (REMIX * 2);
		
		y = door_obj.y - 14;
		if hallway && flip < 0
		{
			var hall_obj = noone;
			with door_obj
				hall_obj = instance_place(x, y, obj_hallway);
			
			if hall_obj
			{
				y = hall_obj.y + 46;
				while !scr_solid(x, y + 1) && !place_meeting(x, y, hall_obj)
					x -= hallwaydirection;
			}
		}
	}
}

if verticalhallway
{
	verticalbuffer = 2;
	
	var _vinst = noone;
	with obj_verticalhallway
	{
		event_perform(ev_step, ev_step_normal);
		if targetDoor == other.targetDoor
			_vinst = id;
	}
	
	if _vinst != noone
	{
		x = _vinst.x + (_vinst.sprite_width * vertical_x);
		var bbox_size = abs(bbox_right - bbox_left);
		x = clamp(x, _vinst.x + bbox_size, _vinst.bbox_right - bbox_size);
		
		if vhallwaydirection > 0
			y = _vinst.bbox_bottom + 32;
		else
			y = _vinst.bbox_top - 78;
		
		if verticalstate == states.climbwall
			state = states.climbwall;
		if state == states.climbwall
		{
			var xx = x;
			while !scr_solid(x + xscale, y)
			{
				x += xscale;
				if abs(x) > room_width
				{
					trace("wallclimbed out of bounds");
					x = xx;
					break;
				}
			}
		}
		y += verticalhall_vsp;
		vsp = verticalhall_vsp;
	}
	y += vhallwaydirection * 20;
	y = floor(y);
	
	verticalstate = states.normal;
}

if oldHallway
{
	x = player_x;
	y = player_y;
	
	if state == states.climbwall
	{
		var xx = x;
		while !scr_solid(x + xscale, y)
		{
			x += xscale;
			if abs(x) > room_width
			{
				trace("wallclimbed out of bounds");
				x = xx;
				break;
			}
		}
	}
}

if character == "M" && place_meeting(x, y, obj_boxofpizza)
{
	while place_meeting(x, y, obj_boxofpizza)
	{
		var _inst = instance_place(x, y, obj_boxofpizza);
		y -= _inst.image_yscale;
	}
}
if state == states.taxi
{
	x = obj_stopsign.x;
	y = obj_stopsign.y;
}
if state == states.spaceshuttle
{
	x = obj_spaceshuttlestop.x;
	y = obj_spaceshuttlestop.y;
}

hallway = false;
verticalhallway = false;
box = false;
oldHallway = false;

if isgustavo
{
	if state != states.ratmountgroundpound
		brick = true;
	else if !brick
	{
		with instance_create(x, y, obj_brickcomeback)
			wait = true;
	}
}

if place_meeting(x, y, obj_exitgate)
{
	global.prank_cankillenemy = true;
	with instance_place(x, y, obj_exitgate)
		other.x = x;
}
else if REMIX && !instance_exists(obj_exitgate)
{
	var found = false;
	with obj_baddie
	{
		if !escape
		{
			found = true;
			break;
		}
	}
	if found
		global.prank_cankillenemy = false;
}

if room == rank_room
{
	x = rankpos_x;
	y = rankpos_y;
}

x = floor(x);
y = floor(y);
roomstartx = x;
roomstarty = y;

with obj_roomposoverride
{
	if targetDoor == other.targetDoor
	{
		other.roomstartx = x;
		other.roomstarty = y;
	}
}

if state == states.chainsaw
{
	hitX = x;
	hitY = y;
	hitLag = 0;
}
smoothx = 0;

if (!instance_exists(obj_secretportalstart) or targetDoor != "S")
&& (!instance_exists(obj_lapportalentrance) or targetDoor != "LAP")
&& targetDoor != "TIMED"
	post_player_modifiers();

if !instance_exists(obj_lapportal) && !instance_exists(obj_exitgate) && global.leveltosave != noone
&& room != forest_2
	global.can_timeattack = false;
