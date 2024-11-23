live_auto_call;
if app_scale <= 0
    exit;

// panic bg
#macro MAX_BLUR 2 / 4

var appa = 1;
if instance_exists(obj_player) && (global.panic or global.snickchallenge)
&& global.panicbg >= 2 && !instance_exists(obj_ghostcollectibles)
    appa = clamp(lerp(1, 1 - MAX_BLUR, global.wave / global.maxwave), 0.01, 1);

// black background
if appa == 1
{
    draw_set_alpha(1);
    gpu_set_blendmode(bm_normal);
    draw_set_color(c_white);
    draw_rectangle_color(-100, -100, savedwidth + 100, savedheight + 100, c_black, c_black, c_black, c_black, false);
}

// anti aliasing
if frac(app_scale) > 0 && global.option_texfilter
{
    var tex = surface_get_texture(application_surface);
    var tw = texture_get_texel_width(tex);
    var th = texture_get_texel_height(tex);
    shader_set(shd_aa);
    gpu_set_texfilter(true);
    shader_set_uniform_f(shader_get_uniform(shd_aa, "u_vTexelSize"), tw, th);
    shader_set_uniform_f(shader_get_uniform(shd_aa, "u_vScale"), window_get_width() / surface_get_width(application_surface), window_get_height() / surface_get_height(application_surface));
}

// draw the game
gpu_set_blendenable(appa != 1);
scr_draw_screen(savedwidth / 2 - (surface_get_width(application_surface) * app_scale) / 2, savedheight / 2 - (surface_get_height(application_surface) * app_scale) / 2, app_scale, app_scale, appa);
gpu_set_blendenable(true);
shader_reset();
gpu_set_texfilter(false);
