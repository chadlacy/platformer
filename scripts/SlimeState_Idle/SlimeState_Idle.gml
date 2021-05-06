// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeState_Idle(){
	if (sprite_index != sSlime) {
		sprite_index = sSlime;
		image_speed = 0.5;
		hsp = 0;
		vsp = 0;
		//slime_wait = irandom_range(50,100);
		slime_wait = 60;
	}
	
	vsp = vsp + grv;
	
	if (slime_wait <= 0) {
		slime_state = SLIMESTATE.MOVE;
	}
	
	slime_wait -= 1;
	
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
}