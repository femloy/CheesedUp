SS_CODE_START;

event_inherited();

landspr = spr_charcherry_run;
idlespr = spr_charcherry_run;
fallspr = spr_charcherry_run;
stunfallspr = spr_charcherry_stun;
walkspr = spr_charcherry_run;
turnspr = spr_charcherry_run;
recoveryspr = spr_charcherry_run;
grabbedspr = spr_charcherry_stun;
scaredspr = spr_charcherry_run;
spr_dead = spr_charcherry_dead;
spr_palette = spr_charcherry_palette;
usepalette = true;
sugary = true;

state = states.wait;
if !global.panic
	sprite_index = spr_charcherry_wait;
slide = 0;

SS_CODE_END;
