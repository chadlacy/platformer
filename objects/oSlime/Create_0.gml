/// @description Insert description here
// You can write your code in this editor
slime_health = 15;
slime_hitstun = 0;
slime_hitstun_duration = 15;
slime_wait = 60;
hsp = 0;
vsp = 0;
grv = 0.15;

sprite_index = sSlime;
image_speed = 0.5;
slime_state = SLIMESTATE.IDLE;

enum SLIMESTATE
{
	IDLE,
	MOVE,
	HITSTUN,
	DEATH
}