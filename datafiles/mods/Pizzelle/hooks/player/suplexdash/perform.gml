if character == "PZ"
{
    state = states.handstandjump;
    fmod_event_instance_play(suplexdashsnd);
    
    var required_state = argument1;
    var suplexspeed = (required_state == states.normal or required_state == states.jump) ? 8 : 5;

    if !REMIX && (required_state == states.normal or required_state == states.jetpackjump)
        movespeed = suplexspeed;
    else
        movespeed = max(movespeed, suplexspeed);
    
    vsp = 0;
    image_index = 0;

    if suplexmove
        sprite_index = spr_suplexdashjumpstart;
    else
    {
        flash = true;
        suplexmove = true;
        sprite_index = shotgunAnim ? spr_shotgunsuplexdash : spr_suplexdash;

        with instance_create(x, y, obj_crazyrunothereffect)
            copy_player_scale(other);
    }

    with instance_create(x, y, obj_jumpdust)
        copy_player_scale(other);
    return false; // cancels normal code
}
