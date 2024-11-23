ensure_order;

x = playerid.x;
y = playerid.y;
if (playerid.state != states.rupertjump && playerid.state != states.freefall && playerid.state != states.superslam && playerid.sprite_index != playerid.spr_ratmount_walljump)
	instance_destroy();
visible = room != rank_room;
