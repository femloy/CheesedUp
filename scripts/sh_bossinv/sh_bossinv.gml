function sh_bossinv()
{
	global.boss_invincible = !global.boss_invincible;
	return $"Boss invincibility {global.boss_invincible ? "ON" : "OFF"}";
}
function meta_bossinv()
{
	return
	{
		description: ""
	}
}
