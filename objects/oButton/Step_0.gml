/// @description Insert description here
// You can write your code in this editor
if (target == noone) {
	for (var cnt = 0; cnt < instance_number(oDoorS); cnt++) {
		var instance = instance_find(oDoorS, cnt);
		
		if (instance.name == door_to_open) {
			target = instance;
			break;
		}
	}
}

if (place_meeting(x,y,oPlayer) || place_meeting(x,y,oStone)) {
	sprite_index = sButtonP;
	button_state = 1;
}
else {
	sprite_index = sButton;
	button_state = 0;
}

if (button_state == 0) {
	if (object_get_name(target.object_index) == "oDoorS") {
		target.door_state = DOORSTATE.CLOSED;
	}
}

if (button_state == 1) {
	if (object_get_name(target.object_index) == "oDoorS") {
		target.door_state = DOORSTATE.OPEN;
	}
}