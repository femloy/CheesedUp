if !instance_exists(obj_player)
	exit;

var condition = room != obj_player1.targetRoom;
if instance_exists(obj_cyop_loader)
	condition = !went;

if roomreset or condition
{
	//trace("[obj_fadeout] Going to room ", obj_player1.targetRoom);
	
	scr_room_goto(obj_player1.targetRoom);
	//if r == tower_peppinohouse // if the previous
	//	scr_unlock_swap();
	went = true;
	
	with (obj_player)
	{
		if (state == states.ejected || state == states.policetaxi)
		{
			visible = true;
			state = states.normal;
		}
	}
}
