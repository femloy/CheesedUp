achievement = 0;
yoffset = 0;
scr_init_input();

var lvl = global.leveltosave;
if global.leveltorestart == boss_pizzaface
    lvl = "pizzaface";

var ach = get_level_achievements(lvl);
sprite = ach.sprite;
achievements = ach.achievements;
