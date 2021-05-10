/// @description Determine orientation for trap from "orientation" in Variable Defintions of object

switch (orientation) {
	case "down":
		// default sprite
	break;
	case "right":
		image_angle = 90;
	break;
	case "up": 
		image_angle = 180;
	break;
	case "left":
		image_angle = 270;
	break;
}