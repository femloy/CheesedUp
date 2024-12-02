image_speed = 0.35;
playerid = noone;

spr_idle = spr_pizzaportal;
spr_enter = spr_pizzaportalend;
spr_outline = spr_pizzaportal_outline;

switch obj_player1.character
{
	case "N":
		spr_enter = spr_pizzaportalendN;
		break;
	case "V":
		spr_enter = spr_pizzaportalendV2;
		break;
}

if SUGARY_SPIRE
{
	sugary = SUGARY;
	if sugary
	{
		spr_idle = spr_lappingportal_idle;
		spr_enter = spr_lappingportal_enter;
	}
}

sprite_index = spr_idle;
ID = id;

var allowed_ta_levels = [
	"entrance", "medieval", "ruin", "dungeon",
	"badland", "farm", "graveyard", "saloon",
	"plage", "forest", "space", "minigolf",
	"street", "industrial", "sewer", "freezer",
	"chateau", "kidsparty", "war",
	
	"entryway", "steamy", "molasses", "sucrose"
];

time_attack = !global.panic && !global.timeattack && !global.in_cyop && array_contains(allowed_ta_levels, global.leveltosave);
if time_attack && !global.can_timeattack //(global.combo > 0 or global.combodropped or global.prank_enemykilled)
{
	time_attack = false;
	/*
	with instance_create(x + image_xscale * 200, y, obj_tutorialbook)
	{
		in_level = true;
		text = lstr("timeattack_tip");
		
		// floor
		while scr_solid(x, y)
			x += other.image_xscale;
		
		for(var yy = y; yy < room_height; yy++)
		{
			if scr_solid(x, yy + 1)
			{
				y = yy;
				break;
			}
		}
	}
	*/
}

// afom
if global.in_afom
{
	maxlaps = 1;
	inlaps = false;
	warmin = 0;
	warsec = 30;
	custommusic = noone;
}
