pal_swap_init_system(shd_pal_swapper);

global.roommessage = "YOUR LAST NAME";
with obj_player1
	if character != "P" global.roommessage = "NOT YOUR LAST NAME";
