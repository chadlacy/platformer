/// @description Initialize important variables upon creation

mush_health = 10;
mush_state = MUSHSTATE.MOVE;

hsp = 0.65;
vsp = 0;
grv = 0.15;

poison_cooldown_max = 120; // Counter that prevents mushroom from going back into poison state for a bit after leaving it
poison_cooldown = 0;

mush_hitstun = 0;
mush_hitstun_duration = 15;


enum MUSHSTATE
{
	MOVE,
	POISON,
	HITSTUN,
	DEATH
}