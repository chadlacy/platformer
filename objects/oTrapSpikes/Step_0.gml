/// @description Logic for springing trap direction


switch (spring_direction) { // Move the spikes
	case "down":
		vsp += 0.5;
	break;
	case "right":
		hsp += 0.5;
	break;
	case "up":
		vsp -= 0.5;
	break;
	case "left":
		hsp -= 0.5;
	break;
}

x = x + hsp;
y = y + vsp;