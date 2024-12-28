event_inherited();

hp = 0;
image_speed = 0.35;
depth = 2;

idlespr = spr_hungrypillar;
angryspr = spr_hungrypillar_angry;
deadspr = spr_hungrypillar_dead;
happyspr = noone;

if SUGARY_SPIRE && SUGARY
{
	idlespr = spr_hungrypillar_ss;
	angryspr = idlespr;
	deadspr = spr_hungrypillar_dead_ss;
}
else if BO_NOISE && MIDWAY
{
	idlespr = spr_hungrypillar_bo;
	angryspr = idlespr;
	deadspr = spr_hungrypillar_angry_bo;
}
else if global.blockstyle == BLOCK_STYLES.old
{
	idlespr = spr_hungrypillar_old;
	angryspr = spr_hungrypillar_angry_old;
	deadspr = spr_hungrypillar_dead_old;
	happyspr = spr_hungrypillar_happy;
}
sprite_index = idlespr;

if global.in_afom
	custommusic = noone;
