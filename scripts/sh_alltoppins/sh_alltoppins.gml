function sh_alltoppins()
{
	if !WC_debug
		return "You do not have permission to use this command";
	
	instance_create_unique(obj_player1.x, obj_player1.y, obj_pizzakincheese);
	instance_create_unique(obj_player1.x, obj_player1.y, obj_pizzakintomato);
	instance_create_unique(obj_player1.x, obj_player1.y, obj_pizzakinsausage);
	instance_create_unique(obj_player1.x, obj_player1.y, obj_pizzakinpineapple);
	instance_create_unique(obj_player1.x, obj_player1.y, obj_pizzakinshroom);
	
	global.cheesefollow = true;
	global.tomatofollow = true;
	global.sausagefollow = true;
	global.pineapplefollow = true;
	global.shroomfollow = true;
}
function meta_alltoppins()
{
	return {
		description: "base game command - Adds all the toppins",
	}
}
