var tx = playerid.x;
var ty = playerid.y - 60;

switch state
{
    case 0:
        if place_meeting(x, y, obj_player)
        {
            playerid = obj_player1.id;
            state++;
            global.combotime = 60;
            add_saveroom();
            xoffset = x - tx;
            yoffset = y - ty;
			
			if instant
				global.collect += value;
        }
        break;
	
    case 1:
        depth = -99;
        x = tx + xoffset;
        y = ty + yoffset;
		
        xoffset = Approach(xoffset, 0, 4);
        yoffset = Approach(yoffset, 0, 4);
		
        if xoffset == 0 && yoffset == 0
        {
            alarm[0] = 1;
            alarm[1] = 2;
            state++;
        }
        break
	
    case 2:
        x = lerp(x, tx, 0.2);
        y = lerp(y, ty, 0.2);
		
		if instant
			instant_time--;
        //if (value <= 0 && !instant) or instant_time <= 0
		if value <= 0
            state++;
        break;
	
    case 3:
        x += 4;
        y -= 8;
        if !bbox_in_camera(view_camera[0], 10)
            instance_destroy();
        break;
}

