if showtext
	yi = Approach(yi, 30, 5);
else
	yi = Approach(yi, -50, 1);

if !(room != rank_room && room != timesuproom && room != Mainmenu && room != Realtitlescreen && room != Longintro && room != Creditsroom && room != Johnresurrectionroom && room != Endingroom && room != Finalintro && room != Scootertransition && !is_bossroom())
{
	showtext = false;
	alarm[0] = -1;
	yi = -50;
}
