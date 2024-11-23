shot = false;
if array_length(objectlist) > 0 && count < array_length(objectlist[wave]) && array_length(objectlist[wave]) > 0
{
    finish = false;
    sprite_index = spr_johnescapeenemy;
    image_index = 0;
}
else
{
    finish = true;
    count = 0;
}
