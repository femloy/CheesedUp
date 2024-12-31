static shine_effect = 0;

var attackdash = shotgunAnim ? spr_shotgunsuplexdash : spr_suplexdash;
if character == "PZ" && sprite_index == attackdash
{
    // ... it also has behaviour code. but does it truly matter? No.
    if !grounded
    {
        if key_down
            vsp = 6;
        if key_down or image_index >= image_number - 4
        {
            sprite_index = spr_suplexdashjumpstart;
            image_index = 0;
        }
        else
            vsp = min(vsp, 0);
    }

    if shine_effect-- <= 0
    {
        shine_effect = 6;
        with instance_create(x, y, obj_explosioneffect)
        {
            sprite_index = spr_shineeffect;
            image_speed = 0.35;
        }
    }

    image_speed = 0.3;
    return false; // cancels normal code
}
