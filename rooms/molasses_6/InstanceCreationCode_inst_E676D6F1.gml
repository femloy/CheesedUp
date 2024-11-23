condition = function()
{
    return !instance_exists(inst_3BE95DD4);
}

output = function()
{
    with (obj_bigcollect)
    {
        if place_meeting(x, y, other)
        {
            instance_create(x, y, obj_cloudeffect)
            repeat (3)
                instance_create((x + random_range(-5, 5)), (y + random_range(-5, 5)), obj_cloudeffect)
            instance_destroy()
        }
    }
}

