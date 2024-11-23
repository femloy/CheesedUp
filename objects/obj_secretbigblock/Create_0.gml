event_inherited();
particlespr = spr_towerblockdebris;
targettiles = ["Tiles_1", "Tiles_2", "Tiles_3", "Tiles_4", "Tiles_Foreground1", "Tiles_Foreground2"];

if global.blockstyle == blockstyles.old
	particlespr = spr_bigdebris;
if SUGARY
	particlespr = spr_bigdebris_ss;
if MIDWAY
	sprite_index = spr_towerblock_bo;

if instance_exists(obj_ghostcollectibles) && REMIX
	particlespr = spr_eyedebris;
