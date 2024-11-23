gate_sprite = spr_gate_noise;
bgsprite = spr_gate_noiseBG;
targetRoom = boss_noise;
save = "w3stick";
group_arr = ["bossgroup", "noisegroup"];
maxscore = global.stickreq[2];
msg = lstr("boss_noise");

if obj_player1.character == "N" || global.swapmode
{
	gate_sprite = spr_gate_doise;
	bgsprite = spr_gate_doiseBG;
	msg = lstr("boss_doise");
}
