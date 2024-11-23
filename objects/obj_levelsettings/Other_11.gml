live_auto_call;

fmod_event_instance_stop(song, false);
with obj_startgate
{
	if place_meeting(x, y, obj_player1)
	{
		obj_player1.image_index = obj_player1.image_number - 1;
		obj_player1.state = states.victory;
		presscount = 2;
		other.state = -1;
		exit;
	}
}
state = room == editor_entrance ? -1 : 3;
