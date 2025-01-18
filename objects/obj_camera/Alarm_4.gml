with obj_player
{
	if !place_meeting(x, y, obj_exitgate)
		global.combodropped = true;
}
if global.hud == HUD_STYLES.april or global.hud == HUD_STYLES.old
	exit;

if room == timesuproom || is_bossroom() || global.leveltosave == "tutorial"
{
	instance_destroy(obj_comboend);
	exit;
}

with obj_comboend
{
	for (var i = 0; i < comboscore; i += comboscore)
		create_collect(obj_player1.x + irandom_range(-60, 60), (obj_player1.y - 100) + irandom_range(-60, 60), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect));
	comboscore = 0;
	instance_destroy();
}
with instance_create(x, y, obj_comboend)
{
	combo = global.savedcombo;
	comboscore = global.comboscore;
	comboscoremax = comboscore;
	notification_push(notifs.combo_end, [combo]);
	combominus = round(comboscore / 50);
}
global.comboscore = 0;
global.savedcombo = 0;
