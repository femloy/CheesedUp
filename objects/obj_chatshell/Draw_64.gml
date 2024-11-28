if !open exit;

draw_set_color(string_length(message_box) > 0 ? c_green : c_red);
draw_rectangle(0, 0, 10, 10, false);
draw_set_color(c_white);