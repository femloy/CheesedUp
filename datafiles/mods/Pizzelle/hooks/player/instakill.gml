// Kill enemies on mach 3 roll or on wall kick
return (character == "PZ" && movespeed > 12 && grounded && state == states.tumble) or state == "PZ_wallkick";
