#macro ensure_order if !instance_exists(other) or other.object_index != obj_eventorder exit

step_order = [
	obj_player,
	obj_baddiecollisionbox,
	obj_forkhitbox,
	obj_camera,
	obj_parallax,
	obj_pause,
	obj_option,
	obj_modconfig,
	obj_screenconfirm,
	
	// effects
	obj_chargeeffect,
	obj_superslameffect
];
room_order = [
	obj_persistent,
	obj_player,
	obj_followcharacter,
	obj_spookeyfollow,
	obj_pizzaface,
	obj_deathmode,
	obj_doornexthub,
	obj_monstertrackingrooms
];

if SUGARY_SPIRE
	array_push(room_order, obj_spookeyfollow);
