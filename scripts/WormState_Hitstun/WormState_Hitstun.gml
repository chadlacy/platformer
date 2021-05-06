// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function WormState_Hitstun(){
	
	if (sprite_index != sWormH) {
		worm_hitstun = worm_hitstun_duration;
		last_vsp = vsp;
		last_hsp = hsp;
		vsp = 0;
		hsp = 0;
		sprite_index = sWormH;
		image_speed = 0.5;
	}
	
	if (worm_hitstun <= 0) {
		vsp = last_vsp;
		hsp = last_hsp;
		worm_state = WORMSTATE.MOVE;
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
	
	worm_hitstun -= 1;
	
}