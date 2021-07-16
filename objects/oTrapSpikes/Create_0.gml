/// @description Initialize variables upon creation

var _parent_trap = instance_place(x,y,oTrap);
spring_direction = _parent_trap.spring_direction;
hsp = 0;
vsp = 0;
depth = 30;

switch (spring_direction) {
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