var p = instance_place(x, y, obj_player);
if p && !instance_exists(ID) && !in_saveroom("mort") && p.state != states.mortattack && p.state != states.mort && p.state != states.mortjump && p.state != states.morthook
{
	if p.character == "V"
		add_saveroom("mort");
	
	instance_destroy(obj_mort);
	with instance_create(x, y - 50, obj_mort)
		other.ID = id;
}
