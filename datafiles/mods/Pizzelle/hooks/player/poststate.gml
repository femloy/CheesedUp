static PZ_sprite_previous = undefined;
static PZ_texture_previous = undefined;
static PZ_state_previous = undefined;

static blue_color = undefined;
static blue_color_dark = undefined;

if character == "PZ"
{
    if PZ_sprite_previous != sprite_index
    {
        // Always start his idle animation from first frame
        if sprite_index == spr_idle
            image_index = 0;

        PZ_sprite_previous = sprite_index;
    }

    if PZ_texture_previous != global.palettetexture or blue_color == undefined or blue_color_dark == undefined
    {
        // Detect afterimage color
        if !sprite_exists(global.palettetexture)
        {
            blue_color = #872CD2;
            blue_color_dark = #200239;
        }
        else
        {
            var surf = surface_create(1, 1);
            surface_set_target(surf);
            draw_sprite(global.palettetexture, 0, sprite_get_xoffset(global.palettetexture), sprite_get_yoffset(global.palettetexture));
            surface_reset_target();
            var col = surface_getpixel(surf, 0, 0);
            surface_free(surf);

            blue_color = col;
            blue_color_dark = make_colour_hsv(colour_get_hue(col), colour_get_saturation(col) * 1.5, colour_get_value(col) * 0.35);
        }

        PZ_texture_previous = global.palettetexture;
    }

    if PZ_state_previous != state
    {
        if state == states.mach3 && PZ_state_previous == states.mach2
            sound_play_3d("event:/sugary/machstart", x, y);
        if state == states.mach3
            spr_machclimbwall = spr_machclimbwall3;

        PZ_state_previous = state;
    }

    // sprite tweaks
    global.force_mach_shader = true;
    global.force_blue_afterimage = state == "PZ_wallkick";
    
    global.mach_colors = [( #30A8F8), ( #E85098)];
    global.mach_colors_dark = [( #0F3979), ( #5F0920)];

    global.blueimg_color = blue_color;
    global.blueimg_color_dark = blue_color_dark;

    spr_finishingblow5 = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4);

    // charge effect
    if state == states.tumble or state == states.climbwall
    {
        if ((state == states.climbwall && wallspeed > 12) or (state != states.climbwall && movespeed > 12)) && !instance_exists(chargeeffectid)
        {
            with instance_create(x, y, obj_chargeeffect)
            {
                playerid = other.id;
                other.chargeeffectid = id;
            }
        }
    }

    // wallkick sound
    if sprite_index == spr_walljumpstart or sprite_index == spr_walljumpend
        sound_instance_move(global.PZ_snd_wallkick, x, y);
    else if sound_is_playing(global.PZ_snd_wallkick)
        fmod_event_instance_set_parameter(global.PZ_snd_wallkick, "state", 1, true);
    
    // state specific
    switch state
    {
        #region CLIMBWALL

        case states.climbwall:
            if wallspeed > 12 && spr_machclimbwall == spr_machclimbwall2
            {
                flash = true;
                sound_play_3d("event:/sugary/machstart", x, y);
            }
            spr_machclimbwall = wallspeed > 12 ? spr_machclimbwall3 : spr_machclimbwall2;
            break;

        #endregion
        #region ROLL/DIVE
        
        case states.tumble:
            if movespeed > 12 && sprite_index == spr_machroll
            {
                sprite_index = spr_backslideland;
                image_index = 0;
            }
            break;
        
        #endregion
        #region SUPER JUMP

        case states.Sjump:
            move = key_left + key_right;
            if move != 0 && sprite_index == spr_superjump
            {
                if xscale != move
                {
                    movespeed = 0;
                    xscale = move;
                }
                hsp = movespeed * sign(move);
                movespeed = Approach(movespeed, 3, 0.5);
            }

            break;
        
        #endregion
        #region WALL KICK

        case "PZ_wallkick":
            suplexmove = true;
            move = key_left + key_right;
            hsp = movespeed;
            
            if move != 0
            {
                movespeed = Approach(movespeed, 10 * move, 0.8);
                dir = move;
            }
            else
                movespeed = Approach(movespeed, 0, 0.45);
            
            if check_solid(x + sign(movespeed), y) && scr_preventbump()
                movespeed = 0;
            
            if !grounded && key_down
            {
                vsp = max(vsp, 14);
                if sprite_index != spr_walljumpfastfallstart && sprite_index != spr_walljumpfastfall
                {
                    sprite_index = spr_walljumpfastfallstart;
                    image_index = 0;
                    fmod_event_instance_play(snd_dive);
                }
                else if input_buffer_jump > 0 && sprite_index == spr_walljumpfastfall
                {
                    input_buffer_jump = 0;
                    state = states.freefall;
                    image_index = 0;
                    sprite_index = spr_poundcancelstart;
                    dir = xscale;
                    hsp = movespeed * xscale;
                    movespeed = abs(movespeed);
                    vsp = -6;
                    freefallsmash = 0;
                }
            }
            
            if scr_slapbuffercheck()
            {
                scr_resetslapbuffer();
                jumpstop = true;
                xscale = dir;
                
                if !key_up
                {
                    sprite_index = spr_walljumpcancelstart;
                    image_index = 0;
                    movespeed = 12;
                    hsp = movespeed * xscale;
                    vsp = -5;
                    state = states.mach3;
                    sound_play_3d("event:/sugary/machstart", x, y);
                    //fmod_studio_event_instance_start(sndWallkickCancel);
                }
                else
                    scr_modmove_uppercut();
            }
            
            if grounded && vsp >= 0
            {
                sound_play_3d("event:/sfx/playerN/wallbounceland", x, y);
                flash = true;
                xscale = dir;
                
                if key_attack
                {
                    /*
                    repeat (5)
                    {
                        instance_create(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), obj_secretpoof, 
                        {
                            sprite_index: spr_spinningFireParticle
                        });
                    }
                    */
                    
                    movespeed = 12;
                    hsp = movespeed * dir;
                    state = states.mach3;
                    image_index = 0;
                    sprite_index = spr_rollgetup;
                    sound_play_3d("event:/sugary/machstart", x, y);
                }
                else
                {
                    landAnim = true;
                    movespeed = 8;
                    hsp = movespeed * dir;
                    state = states.normal;
                    with instance_create(x, y, obj_landcloud)
                        copy_player_scale(other);
                    sound_play_3d(stepsnd, x, y);
                }
            }
            
            if image_index >= image_number - 1
            {
                if sprite_index == spr_walljumpstart
                    sprite_index = spr_walljumpend;
                if sprite_index == spr_walljumpfastfallstart
                    sprite_index = spr_walljumpfastfall;
            }
            
            //if !instance_exists(obj_wallkickDust)
            //    instance_create(x + random_range(-40, 40), y + random_range(-40, 40), obj_wallkickDust);
            
            if punch_afterimage > 0
                punch_afterimage--;
            else
            {
                punch_afterimage = 5;
                with create_blue_afterimage(x, y, sprite_index, image_index, xscale)
                    playerid = other.id;
            }

            scr_dotaunt();
            image_speed = 0.45;
            break;

        #endregion
        #region MACH 3
        
        case states.mach3:
            if sprite_index == spr_walljumpcancelstart && image_index >= image_number - 1
                sprite_index = spr_walljumpcancel;
            if (sprite_index == spr_walljumpcancelstart or sprite_index == spr_walljumpcancel) && grounded
                sprite_index = spr_mach4;
            break;

        #endregion
    }
}
