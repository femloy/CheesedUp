if !instance_exists(obj_cyop_loader) && (instance_exists(obj_elevatorcutscene) or scr_postgame())
{
	instance_change(obj_hubelevator, true);
	exit;
}

event_inherited();
targetDoor = noone;
key = false;
save = "w1stick";
unlocked = false;
state = states.normal;
depth = 50;
