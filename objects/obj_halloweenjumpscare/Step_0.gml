if (!active)
{
    y = (ystart + sprite_height)
    if (distance_to_object(obj_player1) < 250)
    {
        active = true
        sound_play_3d("event:/sfx/misc/pepbotkick", x, y)
    }
}
else
    y = lerp(y, ystart, 0.4)
