/// Attributes for player character upon creation

player_health = 100000; // Do I really need to explain this
hsp = 0; // Horizontal speed
vsp = 0; // Vertical Speed
max_vsp = 12; // Maximum vsp (so long ground pounds don't become ridiculously fast)
grv = 0.15; // Gravity
walksp = 2; // Walk Speed
jumpsp = 4; // Jump speed
djumpsp = jumpsp / 1.2 // Double Jump speed
airspeed = 1;
jump_current = 1; // How many jumps the player is currently able to perform (at this immediate moment)
jump_number = 1; // How many jumps the player is allowed to perform before touching the ground
dash_length = 15; // How long the dash is in frames
dash_cooldown = 0; // This needs to be zero to initiate a dash
enemy = noone; // Used for collision calculations
gp_endlag = 20;
gp_endlag_counter = gp_endlag;
recoiling = 0; // Hitstun/recoil state
buffer = false // Buffer flag used for buffering inputs in some states
last_room = noone; // Stores the last room the player was in for room transitions (must start at "noone" so transition code doesn't freak out)
respawn = noone; // Variable that points to the last respawn point collided with for respawning after spikes
transition_length = 25; // Max value of transition counter
transition_counter = transition_length; // Counter for keeping player in transition state (unactionable)
gold = 0;


// Global variables that determine where player ends up in new room. They are default set to where the player starts the game
global.targetx = 350;
global.targety = 279;

// POWERUPS SECTION
has_dj = true;
has_dash = true;
has_gp = true;
has_push = false;
pushsp = 1;

prev_state = PLAYERSTATE.FREE;
state = PLAYERSTATE.FREE;
hit_by_attack = ds_list_create();

enum PLAYERSTATE
{
	FREE,
	JUMP,
	FALL,
	ATTACK_SLASH,
	ATTACK_SPELL,
	HITSTUN,
	DASH,
	PUSH,
	GROUNDPOUND,
	TRANS,
	HEAL,
	DEATH
}
