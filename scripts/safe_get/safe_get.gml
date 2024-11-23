function safe_get(inst, variable)
{
	if instance_exists(inst)
		return inst[$ variable];
	return undefined;
}
