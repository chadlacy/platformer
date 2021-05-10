/// @description Drops item upon destruction of vase

if (item_dropped != noone) {
	instance_create_layer(x,y,"Instances",item_dropped);
}
