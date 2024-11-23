SS_CODE_START;

if !in_saveroom()
{
    var rep = 4 + ((sprite_width / 32) - 1);
    repeat rep
        create_debris(x + sprite_width / 2, y + sprite_height / 2, spr_waferdestroyable_debris);
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
    add_saveroom();
}

SS_CODE_END;
