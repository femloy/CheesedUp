live_auto_call;

if !instance_exists(playerid) or playerid.hat < 0
{
	instance_destroy();
	exit;
}

var yo = 0, xscale = playerid.xscale;
switch playerid.hat
{
	case HAT.cowboy: sprite_index = spr_cowboyhat; break;
	case HAT.dunce:
		sprite_index = spr_duncehat;
		xscale = MOD.Mirror ? -1 : 1;
		break;
	case HAT.crown: sprite_index = spr_crownhat; break;
	case HAT.uwunya: sprite_index = spr_catearshat; break;
	case HAT.dougdimmadome: sprite_index = spr_dougdimmadome; break;
	case HAT.boobs:
		sprite_index = spr_boobshat;
		xscale = MOD.Mirror ? -1 : 1;
		break;
	case HAT.dunit: sprite_index = spr_dunithat; break;
}
if prev != sprite_index
{
	with instance_create(x, y - 50 + yo, obj_genericpoofeffect)
		depth = other.depth - 1;
	prev = sprite_index;
}

var drawspr = player_sprite(playerid);
var btop = sprite_get_bbox_top(drawspr);
var height = sprite_get_height(drawspr);
var yplus = lengthdir_y(-sprite_get_bbox_top(drawspr) + 40, playerid.angle + 90);

if btop == 0
	btop = height - sprite_get_yoffset(drawspr);

xoffset = 0;
yoffset = lerp(yoffset, yo + yplus + (40 - sprite_get_yoffset(drawspr)), drawspr == playerid.spr_taunt ? 1 : 0.75);

if smooth_buffer > 0
	smooth_buffer--;
x = lerp(x, playerid.x + xoffset + playerid.smoothx, smooth_buffer > 0 ? 1 : Wave(0.4, 0.8, 2, 0));
y = lerp(y, playerid.y + yoffset / 2, smooth_buffer > 0 ? 1 : 0.25);

image_xscale = xscale * playerid.scale_xs;
image_yscale = playerid.yscale * playerid.scale_ys;

if instance_exists(obj_rank) or instance_exists(obj_timesup) or room == Mainmenu or (instance_exists(obj_lapportal) && obj_lapportal.sprite_index == obj_lapportal.spr_enter) or (instance_exists(obj_lapportal) && obj_lapportal.sprite_index == obj_lapportal.spr_enter)
or (instance_exists(obj_lapportalentrance) && obj_lapportalentrance.sprite_index == obj_lapportalentrance.spr_spit)
	visible = false;
else
	visible = playerid.visible;
