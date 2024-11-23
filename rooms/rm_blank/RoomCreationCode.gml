live_room_start();
with obj_door
	event_perform(ev_other, ev_room_start);
with obj_persistent
{
	room_tiles = [];
	room_bgs = [];
	event_user(0);
}
with obj_parallax
	event_perform(ev_other, ev_room_start);
