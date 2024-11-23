if !in_saveroom() && start
{
	add_saveroom();
	with obj_horsey
	{
		if state == states.normal && !in_saveroom() && !in_baddieroom()
			add_baddieroom();
	}
}
global.horse = false;
