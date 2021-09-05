/// @description Initialize variables for slime object upon creation, create states for state machine

slime_health = 15;
slime_hitstun = 0;
slime_hitstun_duration = 15;
slime_hitlag = 0;
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