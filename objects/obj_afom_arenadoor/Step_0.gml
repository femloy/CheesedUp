if !instance_exists(obj_arenaspawn)
	exit;

if (sprite_index == spr_johnescapeenemy)
{
    if (floor(image_index) == 10 && !shot)
    {
        with (instance_create(x, y, objectlist[wave][count]))
        {
            if (obj_arenaspawn.wave >= obj_arenaspawn.ragestart)
                elite = true;
        }
        shot = true;
    }
    if (floor(image_index) == (image_number - 1))
    {
        count++;
        alarm[0] = 10;
        sprite_index = spr_null;
    }
}
