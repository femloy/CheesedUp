/// @description Notify server of room
if instance_exists(obj_player) {
	net_send_tcp("room_change", {
		previous: last_room,
		current: room,
		
		x: obj_player.x,
		y: obj_player.y,
		
		sprite_index: obj_player.sprite_index,
		image_index: obj_player.image_index,
	
		facing: image_xscale,
	});
}