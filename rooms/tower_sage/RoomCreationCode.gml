global.roommessage = lstr("room_towersage");

global.collect = 0;
ds_list_clear(global.saveroom);
ds_list_clear(global.baddieroom);
ds_list_clear(global.baddietomb);
global.prank_enemykilled = false;
global.prank_cankillenemy = true;
global.combodropped = false;
global.combo = 0;
global.combotime = 0;
global.comboscore = 0;
global.previouscombo = 0;
global.style = 0;
global.stylethreshold = 0;
global.heattime = 0;
with obj_camera
	comboend = false;
with obj_player
	supercharged = false;
