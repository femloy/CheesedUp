// x, y, image_xscale and image_yscale have already been set. now we just offset them.
if playerid.character == "PZ"
{
    image_angle = 0;
    if playerid.state == states.tumble
    {
        x += (40 * playerid.xscale);
        y += (20 * playerid.yscale);
        image_yscale *= 0.65;

        if playerid.sprite_index != playerid.spr_backslide && playerid.sprite_index != playerid.spr_backslideland
            visible = false;
    }
    if playerid.state == states.climbwall
    {
        image_angle = 90 * playerid.xscale;
        x -= (20 * playerid.xscale);
        y -= (20 * playerid.yscale);
    }
}
