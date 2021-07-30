/// @description Initialize variables upon creation

var _parent_trap = instance_place(x,y,oTrap);
if (_parent_trap == -4) { // Due to orientation of trap and trap spikes sprites, traps springing upwards do not collide with parent object
	spring_direction = "up"; 
}
else {
	spring_direction = _parent_trap.spring_direction;
}

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