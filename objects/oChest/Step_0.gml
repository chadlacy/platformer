/// @description Insert description here
// You can write your code in this editor
if (sprite_index == sOpenChest) {
	if (item_held == oCoin) {
		if (quantity > 0) {
			var _coin = instance_create_layer(x+8,y-8,"Instances",item_held);
			_coin.hsp = random_range(-1,1);
			_coin.vsp = -2;
			quantity -= 1;
		}
	}
}