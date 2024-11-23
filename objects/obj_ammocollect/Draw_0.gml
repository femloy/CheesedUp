if (flash)
{
	draw_set_flash();
	draw_self();
	draw_reset_flash();
}
else
	draw_self();
