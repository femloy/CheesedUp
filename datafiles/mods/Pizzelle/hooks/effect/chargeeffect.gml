// Extra conditions to get rid of charge effect
return (playerid.state != states.tumble or playerid.movespeed <= 12) && (playerid.state != states.climbwall or playerid.wallspeed < 12);
