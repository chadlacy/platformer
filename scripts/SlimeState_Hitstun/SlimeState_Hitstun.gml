// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeState_Hitstun(){
	
	if (sprite_index != sSlimeH) {
		slime_hitstun = slime_hitstun_duration;
		vsp = 0;
	
		sprite_index = sSlimeH;
		image_speed = 0.5;
	}
	
	if (slime_hitlag > 0) {
		slime_hitlag -= 1;
	}
	else {
		if (slime_hitstun <= 0) {
			slime_state = SLIMESTATE.IDLE;
		}
	
		if (x < oPlayer.x) {
			if (slime_hitstun >= slime_hitstun_duration) {
				hsp = -1;
				vsp = -2;
			} 
			else {
				hsp -= 0.2;
				vsp += 0.2;
			}
		}
		if (x > oPlayer.x) {
			if (slime_hitstun >= slime_hitstun_duration) {
				hsp = 1;
				vsp = -2;
			} 
			else {
				hsp += 0.2;
				vsp += 0.2;
			}
		}
		
		//Horizontal collision
		if (place_meeting(x+hsp,y,oWall)) {
			while (!place_meeting(x+sign(hsp),y,oWall)) {
				x = x + sign(hsp);
			}
			hsp = 0;
		}

		x = x + hsp;


		//Vertical collision
		if (place_meeting(x,y+vsp,oWall)) {
			while (!place_meeting(x,y+sign(vsp),oWall)) {
				y = y + sign(vsp);
			}
			vsp = 0;
		}

		y = y + vsp;
	
		slime_hitstun -= 1;
	}
	
}