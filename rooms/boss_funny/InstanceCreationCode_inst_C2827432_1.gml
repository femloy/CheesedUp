bossspr = spr_vspepperman;
boss_hp = 1;
vstitle = spr_vstitle_pepperman;
boss_columnmax = 1;
boss_rowmax = 1;

boss_func = function()
{
	var eh = 0;
	var p = 0;
	
	with obj_cheeseslime_boss
	{
		eh = hp;
		p = 2;
	}
	
	if p == 0
		boss_hp = 0;
	else
		boss_hp = eh;
};
