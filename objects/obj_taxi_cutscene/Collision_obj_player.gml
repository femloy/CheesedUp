if (targetplayer.id != other.id)
	exit;
other.visible = false;
other.sprite_index = obj_player1.spr_idle;
other.hsp = 0;
other.vsp = 0;
other.state = states.taxi;
playerid = other;
sprite_index = spr_taximove;
hsp = 10;
other.cutscene = true;
if (pickedup == 0)
	instance_create(x, y, obj_genericpoofeffect);
pickedup = true;
