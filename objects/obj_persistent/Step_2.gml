toggle_collisions(global.showcollisions or safe_get(obj_shell, "WC_showcollisions"));

if !safe_get(obj_pause, "pause")
	global.time++;

if global.goodmode
	event_user(2);

if is_holiday(holiday.loy_birthday)
{
	global.world_gravity = 0.75;
	was_birthday = true;
}
else if was_birthday
{
	global.world_gravity = 1;
	was_birthday = false;
}

global.timer_shake = Approach(global.timer_shake, 0, 0.1);
