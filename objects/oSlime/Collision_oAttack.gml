/// @description Insert description here
// You can write your code in this editor
enemy_health -= 5;

with(other) {
	instance_destroy();
}

sprite_index = sSlimeH;
image_speed = 0.5;

hsp = 0;
vsp = 0;