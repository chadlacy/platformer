/// @description Logic for determining how to handle collisions between shockwave and enemies/various interactable objects

var _hit_by_shockwave_now = ds_list_create();
var _hits = instance_place_list(x,y,oInteractable,_hit_by_shockwave_now,false);
if (_hits > 0) {
	for (var i = 0; i < _hits; i++) {
		// If this instance has not yet been hit by this attack
		var hitID = _hit_by_shockwave_now[| i];
		if (ds_list_find_index(hit_by_shockwave, hitID) == -1) {
			ds_list_add(hit_by_shockwave,hitID);
			with(hitID) {	// Decide what to do when sword hits various things
				if (hitID.object_index == oVase) {
					if (sprite_index == sVase) {
						sprite_index = sVaseBreak;
						image_speed = 0.5;
					}
				}
				if (hitID.object_index == oSlime) {
					slime_health -= 5;
					slime_state = SLIMESTATE.HITSTUN();
				}
				if (hitID.object_index == oWorm) {
					worm_health -= 5;
					worm_state = WORMSTATE.HITSTUN();
				}
				if (hitID.object_index == oMushroom) {
					mush_health -= 5;
					mush_state = MUSHSTATE.HITSTUN();
				}
			}
		}
	}
}
ds_list_destroy(_hit_by_shockwave_now);
