function sh_lockcam()
{
	with obj_camera
		lock = !lock;
	return $"Camera lock {obj_camera.lock ? "ON" : "OFF"}";
}
function meta_lockcam()
{
	return
	{
		description: ""
	}
}
