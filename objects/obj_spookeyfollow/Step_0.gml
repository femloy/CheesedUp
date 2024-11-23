SS_CODE_START;

var tgtX = obj_player1.x + (obj_player1.xscale * -30);
var tgtY = obj_player1.y - 40;
var tgtMVSP = distance_to_point(tgtX, tgtY) / 200;
var _d = point_direction(x, y, tgtX, tgtY);

hsp = lengthdir_x((18 * tgtMVSP) + 0.5, _d);
vsp = lengthdir_y((18 * tgtMVSP) + 0.5, _d);
x = Approach(x, tgtX, abs(hsp));
y = Approach(y, tgtY, abs(vsp));

if x != obj_player1.x
    image_xscale = -sign(x - obj_player1.x);

if x != xprevious
    sprite_index = spr_spookey_move;
else
    sprite_index = spr_spookey;

if !global.key_inv
    instance_destroy();

SS_CODE_END;
