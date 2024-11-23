condition = function()
{
	return instance_exists(obj_hungrypillarflash) && obj_player1.x < 1453;
}
output = function()
{
	global.fill = 0;
}
