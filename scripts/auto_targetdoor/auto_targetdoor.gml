function auto_targetdoor()
{
	if place_meeting(x, y, obj_doorG)
		targetDoor = "G";
	else if place_meeting(x, y, obj_doorF)
		targetDoor = "F";
	else if place_meeting(x, y, obj_doorE)
		targetDoor = "E";
	else if place_meeting(x, y, obj_doorD)
		targetDoor = "D";
	else if place_meeting(x, y, obj_doorC)
		targetDoor = "C";
	else if place_meeting(x, y, obj_doorB)
		targetDoor = "B";
	else if place_meeting(x, y, obj_doorA)
		targetDoor = "A";
	else
	{
		with instance_place(x, y, obj_doorX)
			other.targetDoor = door;
	}
}
