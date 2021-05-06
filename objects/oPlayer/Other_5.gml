/// @description Insert description here

last_room = room;

var _room_middle_x = room_width / 2;
var _room_middle_y = room_height / 2;

if (x > _room_middle_x && y > _room_middle_y) {
	quadrant = 1;
}

if (x < _room_middle_x && y > _room_middle_y) {
	quadrant = 2;
}

if (x < _room_middle_x && y < _room_middle_y) {
	quadrant = 3;
}

if (x > _room_middle_x && y < _room_middle_y) {
	quadrant = 4;
}