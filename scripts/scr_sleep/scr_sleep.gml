function scr_sleep(miliseconds)
{
	if global.hitstun == HITSTUN_STYLES.none
		exit;
	
	var time = current_time;
	var ms = miliseconds;
	do {} until current_time - time >= round(ms);
	return current_time - time;
}
