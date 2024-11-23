event_inherited();
spr_intro = spr_toppintomato_intro;
spr_idle = spr_toppintomato;
spr_run = spr_toppintomato_run;
spr_panic = spr_toppintomato_panic;
spr_taunt = spr_toppintomato_taunt;
spr_intro_strongcold = spr_xmastomatotoppin_intro;
spr_idle_strongcold = spr_xmastomatotoppin_idle;
spr_run_strongcold = spr_xmastomatotoppin_walk;

if SUGARY_SPIRE && SUGARY
{
	spr_intro = spr_crack_intro;
	spr_idle = spr_crack_idle;
	spr_run = spr_crack_run;
	spr_panic = spr_crack_panic;
	spr_taunt = spr_crack_taunt;
	spr_supertaunt = spr_crack_supertaunt;
	spr_panicrun = spr_crack_panicrun;
	tv_do_expression(spr_tv_exprconfecti3);
}
