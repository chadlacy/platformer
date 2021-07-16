/// @description Initialize variables and direction trap will spring in upon creation

sprung = false;
finished_sprung = false;
cooldown_length = 80; // Length of frames it takes for trap to be able to be sprung again
activation_timer = cooldown_length; // The counter of how many frames since finished being sprung

switch (image_angle) {
	case 0:
		spring_direction = "down";
	break;
	case 90:
		spring_direction = "right";
	break;
	case 180:
		spring_direction = "up";
	break;
	case 270:
		spring_direction = "left";
	break;
}

//switch (spring_direction) {
//	case "down":
//		// default sprite
//	break;
//	case "right":
//		image_angle = 90;
//	break;
//	case "up": 
//		image_angle = 180;
//	break;
//	case "left":
//		image_angle = 270;
//	break;
//}

