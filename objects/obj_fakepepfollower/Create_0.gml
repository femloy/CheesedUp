event_inherited();
walkspr = spr_fakepeppino_exitwalk;
idlespr = spr_fakepeppino_exitidle;
spr_dead = spr_fakepeppino_stun;
image_speed = 0.35;

use_palette = true;
var _info = get_pep_palette_info();
paletteselect = _info.paletteselect;
spr_palette = _info.spr_palette;
palettetexture = _info.patterntexture;
