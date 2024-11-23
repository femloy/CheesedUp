create_debris(x, y, spr_ballgoal_debris).image_index = 0;
create_debris(x, y, spr_ballgoal_debris).image_index = 1;
create_debris(x, y, spr_ballgoal_debris).image_index = 2;

if vigi
{
	repeat 2
		create_debris(x, y, spr_tntblockdebris);
	
	instance_destroy(obj_pizzaballblock);
	add_saveroom();
	global.combotime = 60;
}
