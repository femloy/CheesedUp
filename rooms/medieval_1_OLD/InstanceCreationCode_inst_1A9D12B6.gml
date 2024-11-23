prompt_condition = function()
{
    with (obj_player)
    {
        if (((sprite_index == spr_Timesup && floor(image_index) == (image_number - 2)) || state == states.normal) && place_meeting(x, y, obj_exitgate))
            return true;
    }
    return false;
}

prompt_array[0] = tv_create_prompt("PTV seems to have catched on camera a glimpse of strange magical cult wearing robes or bathrobes, we cannot tell which but it seems frankly irrelevant.", tvprompt.normal, spr_tv_idleanim1, 3)
