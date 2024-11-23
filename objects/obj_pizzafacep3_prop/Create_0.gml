init_collision();
usepalette = false;
start = false;
stunspr = noone;
angryspr = noone;
use_collision = true;
spr_palette = spr_peppalette;
paletteselect = 1;

particle_set_scale(part.jumpdust, -1, 1);
create_particle(x, y + 10, part.jumpdust);
