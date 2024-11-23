event_inherited();

particlespr = spr_towerblockdebris;
targettiles = ["Tiles_1", "Tiles_2", "Tiles_3", "Tiles_4", "Tiles_Foreground1", "Tiles_Foreground2"];

cyop_textures = [ ];
cyop_vertexbuffers = [ ];

if instance_exists(obj_ghostcollectibles) && REMIX
	particlespr = spr_eyedebris;
