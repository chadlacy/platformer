// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Attack_Slash(){
	
	if (prev_state != PLAYERSTATE.ATTACK_SLASH) {
		prev_state = PLAYERSTATE.ATTACK_SLASH;
	}
	
	var _move = key_right - key_left;
	
	if (!place_meeting(x,y+1,oWall)) { // Take this section out because ground and air speed is 1:1 now
		vsp = vsp + grv;
		hsp = (_move * walksp) * airspeed;
	}
	else {
		vsp = vsp + grv;
		hsp = _move * walksp;
	}
	
	//Start of the attack
	if (sprite_index != sAttackSlash) {
		sprite_index = sAttackSlash;
		image_index = 0;
		image_speed = 0.65;
		var _sword_sound = irandom(2);
		switch (_sword_sound) {
			case 0:
				audio_play_sound(SwordSwing1, 10, false);
			break;
			case 1:
				audio_play_sound(SwordSwing2, 10, false);
			break;
			case 2:
				audio_play_sound(SwordSwing3, 10, false);
			break;
		}
		hitbox = instance_create_layer(x,y,"Instances",oAttackSlash);
		ds_list_clear(hit_by_attack);
	}
	
	// Use attack hitbox and check for hits
	
	with (hitbox) {
		if (other.image_xscale == -1) {
			image_xscale = -1;
		}
		var _hit_by_attack_now = ds_list_create();
		var _hits = instance_place_list(x,y,oInteractable,_hit_by_attack_now,false);
		if (_hits > 0) {
			for (var i = 0; i < _hits; i++) {
				// If this instance has not yet been hit by this attack
				var hitID = _hit_by_attack_now[| i];
				if (ds_list_find_index(hit_by_attack, hitID) == -1) {
					ds_list_add(hit_by_attack,hitID);
					with(hitID) {	// Decide what to do when sword hits various things
						if (hitID.object_index == oLever) {								
							instance_create_layer(hitID.x+8,hitID.y+8,"Instances", oHit);
							oHit.image_xscale = oPlayer.image_xscale;
							if (sprite_index == sLeverL) {
								sprite_index = sLeverR;
							}
							else {
								sprite_index = sLeverL;
							}
							hitID.lever_state = !hitID.lever_state;
						}
						if (hitID.object_index == oVase) {
							instance_create_layer(hitID.x+8,hitID.y+8,"Instances", oHit);
							oHit.image_xscale = oPlayer.image_xscale;
							if (sprite_index == sVase) {
								sprite_index = sVaseBreak;
								image_speed = 0.5;
							}
						}
						if (hitID.object_index == oSlime) {
							instance_create_layer(hitID.x,hitID.y,"Instances", oHit);
							oHit.image_xscale = oPlayer.image_xscale;
							audio_play_sound(SwordHitEnemy, 10, false);
							oPlayer.hitlag = 3;
							slime_hitlag = 3;
							slime_health -= 5;
							slime_state = SLIMESTATE.HITSTUN();
						}
						if (hitID.object_index == oWorm) {
							instance_create_layer(hitID.x,hitID.y,"Instances", oHit);
							oHit.image_xscale = oPlayer.image_xscale;
							audio_play_sound(SwordHitEnemy, 10, false);
							oPlayer.hitlag = 3;
							worm_health -= 5;
							worm_state = WORMSTATE.HITSTUN();
						}
						if (hitID.object_index == oMushroom) {
							instance_create_layer(hitID.x,hitID.y,"Instances", oHit);
							oHit.image_xscale = oPlayer.image_xscale;
							audio_play_sound(SwordHitEnemy, 10, false);
							oPlayer.hitlag = 3;
							mush_health -= 5;
							mush_state = MUSHSTATE.HITSTUN();
						}
					}
				}
			}
		}
		ds_list_destroy(_hit_by_attack_now);
	}
	
	if (vsp < 0 && !key_jump_held) vsp = max(vsp, 0);
	
	if (hitlag > 0) {
		hitlag -= 1;
		image_speed = 0.01;
	}
	else {
		image_speed = 0.65;
	}
	
	if (animation_end()) {
		if (vsp > 0) {
			state = PLAYERSTATE.FALL;
		}
		if (vsp < 0) {
			sprite_index = sPlayerJ;
			state = PLAYERSTATE.JUMP;
		}
		else {
			state = PLAYERSTATE.FREE;
		}
	}
	
	if (dash_cooldown > 0) {
		dash_cooldown -= 1;
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
		if(vsp > 0) // Only reset the number of available jumps if they land on the ground, not if they collide with a celing
	    {
	        jump_current = jump_number;
	    }
		vsp = 0;
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
			}
		}
	}
	
	y = y + vsp;
	
}
