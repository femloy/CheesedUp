if other.targetDoor == "TIMED"
	image_index = 0;

var forgot = false;
if ((image_index == 1 && !(SUGARY_SPIRE && sugary)) or (SUGARY_SPIRE && sugary && sprite_index != spr_sugarygateclosed))
&& !global.panic && room != war_13 && !forgot
{
	with other
	{
		if SUGARY_SPIRE
		{
			if other.sugary && state == states.comingoutdoor && floor(image_index) == image_number - 3
			{
				if other.sprite_index != spr_sugarygateclosing
				{
					other.image_index = 0;
					other.sprite_index = spr_sugarygateclosing;
				}
			}
		}
		if state == states.comingoutdoor && floor(image_index) == image_number - 2
		{
			if MOD.Spotlight
				global.combotime = 60;
			
			sound_play_3d(MIDWAY ? "event:/modded/sfx/gatecloseBN" : "event:/sfx/pep/groundpound", x, y);
			GamepadSetVibration(0, 1, 1, 0.9);
			GamepadSetVibration(1, 1, 1, 0.9);
			set_lastroom();
			sprite_index = isgustavo ? spr_ratmountdoorclosed : spr_Timesup;
			image_index = 0;
			shake_camera(10, 30 / room_speed);
			if SUGARY_SPIRE && other.sugary
			{
				other.sprite_index = spr_sugarygateclosing;
				other.image_index = 1;
				other.image_speed = 0.35;
			}
			else
				other.image_index = 0;
			ds_list_add(global.saveroom, other.id);
			
			if other.direct != 0
				xscale = other.direct;
		}
	}
}

with other
{
	exitgate_x = other.xstart;
	exitgate_y = other.ystart;
	exitgate_room = room;
}

if (drop && dropstate != states.idle)
or global.modifier_failed or (global.leveltosave == "dragonlair" && !global.giantkey)
	exit;

// exit
with other
{
	if grounded && (x > (other.x - 160) && x < (other.x + 160)) && key_up && (state == states.ratmount || state == states.normal || (state == states.Sjumpprep && !(SUGARY_SPIRE && other.sugary)) || state == states.mach1 || state == states.mach2 || state == states.mach3) && (global.panic || global.snickchallenge || room == war_13 || other.random_secret) && room != sucrose_1 && room != tower_finalhallway
		scr_do_exitgate();
}
