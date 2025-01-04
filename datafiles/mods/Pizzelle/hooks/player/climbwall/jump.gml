if character == "PZ"
{
    scr_fmod_soundeffect(jumpsnd, x, y);

    input_buffer_jump = 0;
    key_jump = false;
    railmovespeed = 0;

    image_index = 0;
    sprite_index = spr_walljumpstart;
    movespeed = 4 * xscale;
    vsp = -14;

    jumpstop = false;
    xscale *= -1;
    dir = xscale;
    walljumpbuffer = 4;

    state = "PZ_wallkick";

    fmod_event_instance_set_parameter(MOD_GLOBAL.PZ_snd_wallkick, "state", 0, true);
    fmod_event_instance_play(MOD_GLOBAL.PZ_snd_wallkick);

    /*
    repeat (5)
            {
                instance_create(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), obj_secretpoof, 
                {
                    sprite_index: spr_spinningFireParticle
                });
            }
            
            with (instance_create(x, y, obj_jumpdust, 
            {
                playerID: id
            }))
            {
                image_xscale = other.xscale;
                sprite_index = spr_wallkick_effect;
            }
    */

    return false;
}
