SS_CODE_START;

other.state = states.cotton;
create_particle(other.x, other.y, part.genericpoofeffect);
other.sprite_index = other.spr_cottonidle;
global.combotime = 60;
instance_destroy();

SS_CODE_END;
