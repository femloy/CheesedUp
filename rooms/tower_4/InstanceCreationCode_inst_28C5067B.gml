gate_sprite = spr_gate_fakepep;
bgsprite = spr_gate_fakepepBG;
targetRoom = boss_fakepep;
save = "w4stick";
group_arr = ["bossgroup"];
maxscore = global.stickreq[3];

msg = lstr("boss_fakepep2"); // Fake Peppino
if !global.sandbox
{
	ini_open_from_string(obj_savesystem.ini_str);
	if !ini_read_string("Game", "fakepepportrait", false)
		msg = lstr("boss_fakepep1"); // Peppino
	ini_close();
}
