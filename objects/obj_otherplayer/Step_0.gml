ptt {

/*if x != xprev || y != yprev
{
	lerp_time = 0;
	xprev = x;
	yprev = y;
}*/
lerp_time++;
if lerp_time > lerp_time_max
{
	lerp_time = 0;
	xprev = x;
	yprev = y;
}

}
