// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MushState_Hitstun(){
	if (sprite_index != sMushH) {
		mush_hitstun = mush_hitstun_duration;
		vsp = 0;
	
		sprite_index = sMushH;
	}
	
	if (mush_hitstun <= 0) {
		mush_state = MUSHSTATE.MOVE;
	}
	
	if (x < oPlayer.x) {
		if (mush_hitstun >= mush_hitstun_duration) {
			hsp = -1;
			vsp = -2;
		} 
		else {
			hsp -= 0.2;
			vsp += 0.2;
		}
	}
	if (x > oPlayer.x) {
		if (mush_hitstun >= mush_hitstun_duration) {
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
	
	mush_hitstun -= 1;
}