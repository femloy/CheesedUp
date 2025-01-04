/// @param {string} argument0 - The modifier name as a string
/// @returns {struct} - { sprite, image }

if argument0 == "PizzaMulti"
{
    return
    {
        sprite: MOD_GLOBAL.spr_pizzamulti_icon,
        image: 0
    };
}

// Returning here without any checks will conflict with other mods and Cheesed Up itself
