/// @description Logic to assign target door to lever

if (target == noone) { // Target is set to noone upon creation, change "door_to_open" in Variable Definitions of button instance to the desired target door
	for (var cnt = 0; cnt < instance_number(oDoorS); cnt++) {
		var instance = instance_find(oDoorS, cnt);
		
		if (instance.name == door_to_open) {
			target = instance;
			break;
		}
	}
}

if (lever_state == 0) {
	if (object_get_name(target.object_index) == "oDoorS") {
		target.door_state = DOORSTATE.CLOSED;
	}
}

if (lever_state == 1) {
	if (object_get_name(target.object_index) == "oDoorS") {
		target.door_state = DOORSTATE.OPEN;
	}
}

