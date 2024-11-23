gate_sprite = spr_gate_vigilante;
bgsprite = spr_gate_vigilanteBG;
targetRoom = boss_vigilante;
save = "w2stick";
group_arr = ["bossgroup", "vigilantegroup"];
maxscore = global.stickreq[1];
msg = lstr("boss_vigilante");

if check_char("V")
{
	gate_sprite = spr_gate_snotty;
	bgsprite = spr_gate_snottyBG;
	msg = lstr("boss_snotty");
}
