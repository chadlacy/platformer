// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NineSliceBox(){
	//Gets the variables through arguments.
	var _sprite = argument[0];
	var _x1 = argument[1];
	var _y1 = argument[2];
	var _x2 = argument[3];
	var _y2 = argument[4];
	var _size = sprite_get_width(_sprite) / 3;
	var _w = _x2 - _x1;
	var _h = _y2 - _y1;
	var _columns = _w div _size;
	var _rows = _h div _size;
	
	//CORNERS
	//Top left
	draw_sprite_part(_sprite, 0, 0, 0, _size, _size, _x1, _y1);
	//Top right
	draw_sprite_part(_sprite, 0, _size*2, 0, _size, _size, _x1+(_columns*_size)  , _y1);
	//Bottom left
	draw_sprite_part(_sprite, 0, 0, _size*2, _size, _size, _x1, _y1+(_rows*_size));
	//Bottom right
	draw_sprite_part(_sprite, 0, _size*2, _size*2, _size, _size, _x1+(_columns*_size), _y1+(_rows*_size));
	
	//EDGES
	for (var i = 1; i < _rows; i++) {
		//Left edge
		draw_sprite_part(_sprite, 0, 0, _size, _size, _size, _x1, _y1+(i*_size));
		//Right edge
		draw_sprite_part(_sprite, 0, _size*2, _size, _size, _size, _x1+(_columns*_size), _y1+(i*_size));
	}
	for (var i = 1; i < _columns; i++) {
		//Top edge
		draw_sprite_part(_sprite, 0, _size, 0, _size, _size, _x1+(i*_size), _y1);
		//Bottom edge
		draw_sprite_part(_sprite, 0, _size, _size*2, _size, _size, _x1+(i*_size), _y1+(_rows*_size));
	}
	//MIDDLE
	for (var i = 1; i < _columns; i++) {
		for (var j = 1; j < _rows; j++) {
			draw_sprite_part(_sprite, 0, _size, _size, _size, _size, _x1+(i*_size), _y1+(j*_size));
		}
	}
}