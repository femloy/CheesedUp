var player = other.id;
if is_callable(condition) && !condition(player)
	exit;

var tip = create_transformation_tip(text, save_entry == "noone" ? noone : save_entry);
if is_callable(tip_func) with tip
	other.tip_func(player);

if is_callable(output)
	output(player);
