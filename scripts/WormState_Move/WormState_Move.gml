// Script assets have changed for v2.3.0 see
// https://help.oDetector.yooDetector.yogames.com/hc/en-us/articles/360005277377 for more information
function WormState_Move(){
	
	if (sprite_index != sWormW) {
		sprite_index = sWormW;
	}
	
	if (worm_direction == 0) { // Clockwise
		switch (image_angle){
			case 0: // Moving right, right side up
				hsp = 0.25;
				vsp = 0;
			break;
			case 90: // Moving up, left side of wall
				hsp = 0;
				vsp = -0.25; 
			break;
			case 180: // Moving left, upside down
				hsp = -0.25;
				vsp = 0;
			break;
			case 270: // Moving down, right side of wall
				hsp = 0;
				vsp = 0.25;
			break;
		}
	}
	else { // Counter clockwise
		switch (image_angle){
			case 0: // Moving left, right side up
				hsp = -0.25;
				vsp = 0;
			break;
			case 90: // Moving down, left side of wall
				hsp = 0;
				vsp = 0.25; 
			break;
			case 180: // Moving right, upside down
				hsp = 0.25;
				vsp = 0;
			break;
			case 270: // Moving up, right side of wall
				hsp = 0;
				vsp = -0.25;
			break;
		}
	}
	
	x = x + hsp;
	
	y = y + vsp;

}