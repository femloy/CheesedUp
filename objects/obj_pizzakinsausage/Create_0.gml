event_inherited();
spr_intro = spr_toppinsausage_intro;
spr_idle = spr_toppinsausage;
spr_run = spr_toppinsausage_run;
spr_panic = spr_toppinsausage_panic;
spr_taunt = spr_toppinsausage_taunt;
spr_intro_strongcold = spr_xmassausagetoppin_intro;
spr_idle_strongcold = spr_xmassausagetoppin_idle;
spr_run_strongcold = spr_xmassausagetoppin_walk;

if SUGARY
{
	spr_intro = spr_gummyworm_intro;
	spr_idle = spr_gummyworm_idle;
	spr_run = spr_gummyworm_run;
	spr_panic = spr_gummyworm_panic;
	spr_taunt = spr_gummyworm_taunt;
	spr_supertaunt = spr_gummyworm_supertaunt;
	spr_panicrun = spr_gummyworm_panicrun;
	
	tv_do_expression(spr_tv_exprconfecti4);
}
