live_auto_call;

if x != xprev || y != yprev
{
	lerp_time = 0;
	xprev = x;
	yprev = y;
}
if lerp_time < lerp_time_max * 2
	lerp_time++;

switch state
{
	case states.backbreaker:
		if state_prev != states.backbreaker
			instance_create(x, y, obj_baddietaunteffect);
		lerp_time = lerp_time_max;
		break;
}
state_prev = state;
