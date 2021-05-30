// This script contains the code for the "Free" state of the player
// Free state can possibly transition to these states:
// JUMP
// FALL
// ATTACK.SLASH
// HITSTUN
// DASH
// PUSH
// DEATH
// TRANS

function PlayerState_Free(){
	
	if (prev_state == PLAYERSTATE.FALL) {
		dash_cooldown = 0;
		jump_current = jump_number;
	}
	
	if (prev_state != PLAYERSTATE.FREE) {
		prev_state = PLAYERSTATE.FREE;
	}

	// Set jump number based on whether player has acquired double jump powerup
	if (has_dj == true) {
		jump_number = 2;
	}

	// Check for collision with enemies
	if (place_meeting(x,y,oEnemy)) {		
		enemy = instance_place(x,y,oEnemy);
		state = PLAYERSTATE.HITSTUN;	
	}

	// Calculate movement
	var _move = key_right - key_left;		

	hsp = _move * walksp;
	vsp = vsp + grv;
	
	// Transitions to different states
	if (key_attack) state = PLAYERSTATE.ATTACK_SLASH;
	if (key_dash && has_dash == true && dash_cooldown <= 0) state = PLAYERSTATE.DASH;
	if (key_shoot) state = PLAYERSTATE.ATTACK_SPELL;
	
	if (key_jump) {
		dash_cooldown = 0;
		state = PLAYERSTATE.JUMP;
	}
	
	// Check for valid transitions to fall state
	var _player_feet = y + sprite_height / 2;
	
	if (vsp > 0 && !place_meeting(x,y+1,oWall) && !place_meeting(x,_player_feet+1,oPlatform) && !place_meeting(x,y+1,oStone)) { // If player is not on ground, put in fall state
		state = PLAYERSTATE.FALL;
	}
	
	if (place_meeting(x,_player_feet+1,oPlatform) && !place_meeting(x,y+1,oWall) && key_down_held) { // Put player in fall state when they drop through platforms
		state = PLAYERSTATE.FALL;
	}
	
	// Check for horizontal collision with stones, and then send player to push state if they have the powerup
	if (place_meeting(x+hsp,y,oStone) && (place_meeting(x,y+1,oWall) || place_meeting(x,y+1,oPlatform))) {
		while (!place_meeting(x+sign(hsp),y,oStone)) {
			x = x + sign(hsp);
		}
		hsp = 0;
		if (has_push == true && oStone.vsp == 0) { // Don't want player going in and out of push state erratically during beginning moments of pushing stone off of ledge
			state = PLAYERSTATE.PUSH;
		}
	}
	
	// Check for collision with spikes
	if (place_meeting(x,y,oSpikes)) {
		player_health -= 35;
		if (player_health <= 0) {
			state = PLAYERSTATE.DEATH;
		}
		else {
			state = PLAYERSTATE.TRANS;
		}
	}
	
	// Decrement dash cooldown every frame if cooldown isn't done
	if (dash_cooldown > 0) {
		dash_cooldown -= 1;
	}
	
	// Checking for reading signs (if a sign is in the room)
	if (place_meeting(x,y,oWoodSign) && key_up) {
		var _sign = instance_place(x,y,oWoodSign);
		if (!instance_exists(oText)){	
			// Get each entry of array of sign_text then add it to the list text_queue
			for (var i=0;i<array_length_1d(_sign.sign_text);i++) {
				ds_list_add(oGame.text_queue, _sign.sign_text[i]);
			}
			instance_create_layer(x,y,"Instances",oText);
		}
	}
	
	// Check for opening chests (if a chest is in the room)
	if (place_meeting(x,y,oChest) && key_up) {
		var _chest = instance_place(x,y,oChest);
		if (_chest.sprite_index == sChest) { // Only allow player to open closed chests
			_chest.sprite_index = sChestOpening;
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
		// Reset all counters/variables for movement optons that can be performed midair
		dash_length = 15;
		jump_current = jump_number;
		gp_stall = 0;
	}
	
	//Vertical collision with stones
	if (place_meeting(x,y+vsp,oStone)) {
		while (!place_meeting(x,y+sign(vsp),oStone)) {
			y = y + sign(vsp);
		}
		vsp = 0;
		// Reset all counters/variables for movement optons that can be performed midair
		dash_length = 15;
		jump_current = jump_number;
		gp_stall = 0;
	}
	
	//Vertical collision with platforms (can only collide from above platform)
	if (instance_exists(oPlatform)) {
		var _player_feet = y + sprite_height / 2;
		var _nearest_platform = instance_nearest(x,y,oPlatform);
	
		if (floor(_player_feet) < floor(_nearest_platform.y+1) && !key_down_held) {
			if (place_meeting(x,y+vsp,_nearest_platform)) {
				while (!place_meeting(x,y+sign(vsp),_nearest_platform)) {
					y = y + sign(vsp);
				}
				vsp = 0;
				// Reset all counters/variables for movement optons that can be performed midair
				dash_length = 15;
				jump_current = jump_number;
				gp_stall = 0;
			}
		}
	}

	y = y + vsp;

	// Animation
	
	if (hsp == 0) {
		image_speed = 0.35;
		sprite_index = sPlayer;
	} 
	else {
		image_speed = 0.40;
		sprite_index = sPlayerR;
		image_xscale = sign(hsp);
	}
	
}

