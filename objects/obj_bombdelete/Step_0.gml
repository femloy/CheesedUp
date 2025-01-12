sprite_index = !collide ? spr_bomb : noone;
if instance_exists(obj_bomb)
	collide = false;
if !instance_exists(obj_player) or obj_player1.state != states.bombdelete
	collide = false;
