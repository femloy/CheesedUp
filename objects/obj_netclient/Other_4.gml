/// @description Notify server of room
if instance_exists(obj_player)
{
	net_send_tcp("room_change",
	{
		previous: last_room,
		current: room,
		
		x: obj_player.x,
		y: obj_player.y,
		
		sprite: player_sprite(obj_player1),
		frame: obj_player1.image_index,
		xscale: image_xscale,
	});
}
