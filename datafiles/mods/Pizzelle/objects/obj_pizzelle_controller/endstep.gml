with obj_player
{
    if character != "PZ" continue;

    // rolling charge effect
    with chargeeffectid
    {
        sprite_index = spr_chargeeffect;
        image_angle = 0;

        if other.state == states.tumble
        {
            x += (40 * other.xscale);
            y += (20 * other.yscale);
            image_yscale *= 0.65;

            if other.sprite_index != other.spr_backslide && other.sprite_index != other.spr_backslideland
                visible = false;
        }
        if other.state == states.climbwall
        {
            image_angle = 90;
            x -= (20 * other.xscale);
            y -= (20 * other.yscale);
        }
    }
}
