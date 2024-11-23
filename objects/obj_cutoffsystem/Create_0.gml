cutoffs = [];
function add_cutoff(x, y, big, angle)
{
	array_push(cutoffs, {x: x, y: y, big: big, angle: angle, img: choose(0, 1), buffer: 2});
}
depth = 50;
global.auto_cutoffs = true;
