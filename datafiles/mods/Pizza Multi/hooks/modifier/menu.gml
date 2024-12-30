add_modifier("PizzaMulti", #E08858, function(val)
{
    draw_set_font(global.font_small);
    draw_set_align(fa_center, fa_middle);
    draw_set_color(c_white);
    draw_text(width / 2, height / 2, "It is Working.");
});

// "PizzaMulti" is the name set in "init.gml" and "modifier/reset.gml"
// #E08858 is the modifier's background color
// function(val) is for drawing the preview. You can use "width" and "height" to get the boundaries

// For language support, use tdp_... functions for drawing text
// Reference base game code for that, I didn't change how it works
