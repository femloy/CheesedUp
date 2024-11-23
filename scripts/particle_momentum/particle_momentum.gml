function particle_momentum(player = obj_player1)
{
	if !REMIX exit;
	
	particle_hsp(player);
	particle_vsp(player);
}
function particle_hsp(player = obj_player1)
{
	if !REMIX exit;
	
	momentum.x = player.hsp / 2;
}
function particle_vsp(player = obj_player1)
{
	if !REMIX exit;
	
	if player.vsp < 0
		momentum.y = player.vsp / 2;
}
