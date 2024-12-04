live_auto_call;

/*if x != xprev || y != yprev
{
	lerp_time = 0;
	xprev = x;
	yprev = y;
}*/
lerp_time++;
if lerp_time > lerp_time_max || x == xprev
{
	lerp_time = 0;
	xprev = x;
	yprev = y;
}

switch state
{
	case states.backbreaker:
		if state_prev != states.backbreaker
			instance_create(x, y, obj_baddietaunteffect);
		lerp_time = lerp_time_max;
		break;
}
state_prev = state;