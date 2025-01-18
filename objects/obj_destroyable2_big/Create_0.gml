event_inherited();
depth = 1;
content = noone;
particlespr = -1;
spr_dead = spr_bigpizzablockdead;

if SUGARY_SPIRE && check_char("SP")
{
	sprite_index = spr_candybigbreakable;
	spr_dead = spr_bigcandyblockdead;
	
	if global.blockstyle == BLOCK_STYLES.old
	{
		sprite_index = spr_bigbreakableSP_old;
		particlespr = spr_bigcandydebris;
		spr_dead = -1;
	}
}
else if BO_NOISE && check_char("BN")
{
	sprite_index = spr_bigbreakable_bo;
	spr_dead = spr_bigpizzablockdead_bo;
}
else if global.blockstyle == BLOCK_STYLES.old
{
	sprite_index = spr_bigbreakable_old;
	particlespr = spr_bigpizzadebris;
	spr_dead = -1;
}
