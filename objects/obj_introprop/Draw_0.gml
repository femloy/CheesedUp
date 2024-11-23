if (!sprite_exists(sprite_index))
	exit;

if (sprite_index != spr_towerending_swapmode && sprite_index != spr_towerending_gustavo && sprite_index != spr_towerending_peppino && sprite_index != spr_towerending_bosses && sprite_index != spr_towerending_noise && sprite_index != spr_towerending_noisey)
	draw_self();
else
{
	pal_swap_player_palette();
	draw_self();
	pal_swap_reset();
}
