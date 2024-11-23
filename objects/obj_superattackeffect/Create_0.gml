image_speed = 0.1;
x = -sprite_width;
y = 200;
movespeed = 10;

switch obj_player1.character
{
	case "N":
		sprite_index = spr_noise_superattackHUD;
		break;
	case "V":
		sprite_index = spr_vigi_superattackHUD;
		break;
}
