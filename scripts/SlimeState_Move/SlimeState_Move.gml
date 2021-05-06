// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeState_Move(){
	
	if (sprite_index != sSlimeW) {
		sprite_index = sSlimeW;
		image_speed = 0.5;
		slime_wait = 60;
	}
	
	if (slime_wait <= 40 && slime_wait > 16) {
		// Enemy AI is simple, they just follow the player at a slowish speed
		if (x > oPlayer.x && hsp != 1) {
			hsp = -1;
			image_xscale = 1; // Make sure they face the right way while moving
		}
		else if (x < oPlayer.x && hsp != -1) {
			hsp = 1;
			image_xscale = -1;
		}
		slime_wait -= 1;
	}
	else {
		hsp = 0;
		slime_wait -= 1;
	}
	
	if (animation_end()){
		slime_state = SLIMESTATE.IDLE;
	}
	
	//Horizontal collision
	if (place_meeting(x+hsp,y,oWall)) {
		while (!place_meeting(x+sign(hsp),y,oWall)) {
			x = x + sign(hsp);
		}
		hsp = 0;
	}

	x = x + hsp;

	vsp = vsp + grv;
	//Vertical collision
	if (place_meeting(x,y+vsp,oWall)) {
		while (!place_meeting(x,y+sign(vsp),oWall)) {
			y = y + sign(vsp);
		}
		vsp = 0;
	}

	y = y + vsp;
}