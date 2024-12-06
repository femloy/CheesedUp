switch state
{
	case states.backbreaker:
		if state_prev != states.backbreaker
			instance_create(x, y, obj_baddietaunteffect);
		lerp_time = lerp_time_max;
		break;
}
state_prev = state;

if x_prev != x
	net_log($"{x_prev}->{x}");

x_prev = x;
y_prev = y;