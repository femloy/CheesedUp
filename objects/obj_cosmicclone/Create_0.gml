live_auto_call;

depth = obj_drawcontroller.depth + 1;
mask_index = spr_player_mask;

queue = ds_queue_create();
image_speed = 0.35;
target_object = obj_player1;
is_visible = true;
sprite_previous = sprite_index;

state = states.normal;
grace_period = 10;
tracker = noone;
parried = false;

init_collision();

// queue size
distance = 40;

random_color = function()
{
	return choose(#280040, #03205c, #000078);
}

// sounds
switch obj_player1.character
{
	default:
		snd_jump = fmod_event_create_instance(sfx_jump);
		break;
	case "V":
		snd_jump = fmod_event_create_instance("event:/modded/playerV/jump");
		break;
}
switch obj_player1.character
{
	case "P": case "SP":
		snd_voicehurt = fmod_event_create_instance(obj_player1.isgustavo ? "event:/sfx/voice/gushurt" : "event:/sfx/voice/hurt");
		break;
	case "N":
		snd_voicehurt = fmod_event_create_instance(sfx_hurt);
		break;
	case "V":
		snd_voicehurt = fmod_event_create_instance("event:/sfx/voice/vigiduel");
		break;
	default:
		snd_voicehurt = fmod_event_create_instance("event:/nosound");
		break;
}
switch obj_player1.character
{
	default:
		snd_jump = fmod_event_create_instance(sfx_jump);
		break;
	case "V":
		snd_jump = fmod_event_create_instance("event:/modded/playerV/jump");
		break;
}
switch obj_player1.character
{
	default:
		snd_taunt = fmod_event_create_instance(sfx_taunt);
		break;
	case "SP":
		snd_taunt = fmod_event_create_instance("event:/modded/sfx/pizzytaunt");
		break;
}
