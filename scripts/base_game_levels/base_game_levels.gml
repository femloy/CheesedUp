function base_game_levels(include_exit = true, include_boss = false)
{
	var a = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "minigolf", "space", "sewer", "industrial", "street", "freezer", "chateau", "war", "kidsparty"];
	if include_boss
		array_push(a, "b_pepperman", "b_vigilante", "b_noise", "b_fakepep", "b_pizzaface");
	if include_exit
		array_push(a, "exit");
	return a;
}
