function totem_empty(totem)
{
	with (totem)
	{
		for (var i = 0; i < array_length(cheeseID); i++)
		{
			if (cheeseID[i] == noone)
				return true;
		}
		return false;
	}
}
function totem_add(totem, ID)
{
	with (totem)
	{
		for (var i = 0; i < array_length(cheeseID); i++)
		{
			if (cheeseID[i] == noone)
			{
				cheeseID[i] = ID;
				return true;
			}
		}
		return false;
	}
}
function totem_clear(totem)
{
	with (totem)
	{
		for (var i = 0; i < array_length(cheeseID); i++)
		{
			if (cheeseID[i] != noone && (!instance_exists(cheeseID[i]) || cheeseID[i].state != states.totem))
			{
				if (instance_exists(cheeseID[i]))
					cheeseID[i].totemID = noone;
				cheeseID[i] = noone;
			}
		}
	}
}
function totem_count(totem)
{
	var c = 0;
	with (totem)
	{
		for (var i = 0; i < array_length(cheeseID); i++)
		{
			if (cheeseID[i] != noone)
				c++;
		}
		return c;
	}
}
