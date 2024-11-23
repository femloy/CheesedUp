function sh_test_p_rank()
{
	global.collect = global.srank + 5000;
	global.lap = true;
	global.treasure = true;
	global.secretfound = 3;
	global.combodropped = false;
	global.prank_enemykilled = true;
	global.combotime = 60;
	global.combo = 99;
	global.panic = true;
}
function meta_test_p_rank()
{
	return {
		description: "base game command",
	}
}
