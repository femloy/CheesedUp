/// @param {bool} argument0 - Whether the destroy event should be called
/// @returns {bool} - false if the object shouldn't get deleted

if MOD.PizzaMulti && argument0
{
    if check_boss(object_index)
        exit;
    
    var objects =
    [
        obj_collect,
        obj_bigcollect,
        obj_destructibles,
        obj_metalblock,
        obj_baddie,
        obj_pizzaboxunopen,
        obj_ratblock,
    ];
    
    while array_length(objects)
    {
        var o = array_pop(objects);
        if object_index == o or object_is_ancestor(object_index, o)
        {
            var p = instance_nearest(x, y, obj_player);
            var wd = abs(bbox_right - bbox_left);
            
            if o == obj_baddie
                wd = 0;
            else if o == obj_pizzaboxunopen
                wd = 48;
            
            with instance_create(x + wd * p.xscale, y, object_index)
            {
                depth = other.depth;
                if o == obj_baddie
                {
                    hsp = other.hithsp;
                    vsp = other.hitvsp;
                    stunned = 200;
                    state = states.stun;
                }
                if o == obj_pizzaboxunopen
                    content = other.content;
            }
            break;
        }
    }
}
