flags.do_once_per_save = true;
condition = function()
{
    var _check = false;
    with obj_player1
    {
        if targetDoor == "D"
            _check = true;
    }
    return _check;
}

output = function()
{
    with obj_geyserCutscene
    {
        sprite_index = spr_geysercutscene_active;
        image_index = 0;
    }
}
