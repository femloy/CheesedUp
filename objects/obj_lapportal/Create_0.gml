image_speed = 0.35;
playerid = noone;

spr_idle = spr_pizzaportal;
spr_enter = spr_pizzaportalend;
spr_outline = spr_pizzaportal_outline;
spr_gone = spr_pizzaportalgone;

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
	"chateau", "kidsparty", "war", "exit"
];

time_attack = !global.panic && !global.timeattack && !global.in_cyop && array_contains(allowed_ta_levels, global.leveltosave);
if time_attack && !global.can_timeattack
	time_attack = false;

// afom
if global.in_afom
{
	maxlaps = 1;
	inlaps = false;
	warmin = 0;
	warsec = 30;
	custommusic = noone;
}
