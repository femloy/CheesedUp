ensure_order;

if room != Loadiingroom && room != Realtitlescreen && room != Titlescreen && room != Initroom && room != Longintro && room != Mainmenu
    instance_create_unique(0, 0, obj_netclient);

scr_getinput();
event_inherited();
