/// @description logic for springing trap 

if (sprung == true) {
	if (image_index == 5) {
		var _trap_spikes = instance_create_layer(x,y,"Instances",oTrapSpikes);
		finished_sprung = true;
	}
	if (finished_sprung == true) {
		image_index = 1;
	}
}
else {
	image_index = 1;
}

if (finished_sprung == true) {
	if (activation_timer <= 0) {
		sprung = false;
		finished_sprung = false;
		activation_timer = cooldown_length;
	}
	activation_timer -= 1;
}