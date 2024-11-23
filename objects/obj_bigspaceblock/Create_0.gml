event_inherited();

sprite_index = spr_bigdestroy;
depth = 1;

// CYOP is base game, but AFOM uses old behavior
new_behavior = global.in_cyop && !global.in_afom;
