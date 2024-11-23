live_auto_call;

if global.timeattack
{
	if !instance_exists(obj_endlevelfade) && room != rank_room
		global.tatime++;
	timer_y = Approach(timer_y, 0, 1);
	barfill_x -= 0.2;
}
else
{
	timer_y = global.hud == hudstyles.minimal ? 64 : 150;
	lost_clock = false;
}
