// Whether to bump or not
if character == "PZ" && state == states.tumble && grounded && movespeed > 12 && place_meeting(x + hsp, y, obj_metalblock)
    return false;
