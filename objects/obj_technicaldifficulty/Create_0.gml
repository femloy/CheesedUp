depth = -100;
image_speed = 0.35;
sprite = noone;
static_index = 0;
static_max = 15;
static_dir = 1;
use_static = true;
alarm[0] = 80;
noise = false;
sound_play("event:/sfx/ui/tvswitch");
with (obj_player)
	state = states.actor;

chara = obj_player1.character;
if obj_player1.isgustavo
	chara = "G";
if chara == "P" && obj_player1.character == "N"
	chara = "N";

topleft = false;
sprite = choose(spr_technicaldifficulty1, spr_technicaldifficulty2, spr_technicaldifficulty3);
switch chara
{
	case "N":
		sprite = choose(spr_technicaldifficulty5, spr_technicaldifficulty6, spr_technicaldifficulty7);
		break;
	case "G":
		sprite = spr_technicaldifficulty4;
		break;
	case "V":
		sprite = choose(spr_technicaldifficulty1V, spr_technicaldifficulty2V, spr_technicaldifficulty3V);
		topleft = true;
		break;
	case "SP":
		if SUGARY_SPIRE
			sprite = choose(spr_technicaldifficulty1SP, spr_technicaldifficulty2SP, spr_technicaldifficulty3SP);
		topleft = true;
		break;
}
