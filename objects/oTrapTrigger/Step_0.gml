/// @description Finds corresponding trap to trigger based on what has been assigned to target variable

if (target == noone) {
	for (var cnt = 0; cnt < instance_number(oTrap); cnt++) {
		var instance = instance_find(oTrap, cnt);
		
		if (instance.trap_name == target_trap) {
			target = instance;
			break;
		}
	}
}

if (place_meeting(x,y,oPlayer)) {
	if (object_get_name(target.object_index) == "oTrap") {
		target.sprung = true;
	}
}
