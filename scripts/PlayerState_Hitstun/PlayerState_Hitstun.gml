// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Hitstun(){
	
	if (prev_state != PLAYERSTATE.HITSTUN) {
		
		prev_state = PLAYERSTATE.HITSTUN;
		
		sprite_index = sPlayerH;
		image_index = 1;
		image_speed = 0.5;
		
		// Get ID of enemy for recoil calculations later on
		enemy = instance_place(x,y,oEnemy);
		player_health -= 10;
		recoiling = 15;
		// Set player speed to 0 so recoiling physics are consistent regardless of what happens before collision
		hsp = 0;
		vsp = 0;
	}
	
	if (player_health <= 0) { // If you die, u ded
		state = PLAYERSTATE.DEATH;
	}
		
	// Collision with enemies
		
	// We want a big speed boost (recoil) first few frames after getting hit, then quickly slow down
	
	if (recoiling <= 8) { // This is the slowing down
		hsp += -0.656 * sign(hsp);
		vsp = grv;
	} else { // These are the speed boosts
		
		if (enemy.x > x) { // If hitting left side of enemy, recoil left
			hsp += -0.75;
			vsp += -0.25;
		}
	
		if (enemy.x < x) { // If hitting right side of enemy, recoil right
			hsp += 0.75;
			vsp += -0.25;
		}
	}
	
		
	recoiling -= 1;
	
	if (recoiling <= 0) {
		state = PLAYERSTATE.FREE;
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
	
}