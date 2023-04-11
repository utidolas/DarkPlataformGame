/// @description Insert description here
spd = 2;
xspd = 0;
yspd = 0;
player_gravity = .5;
life = 100;
previous_state = noone;
jump_value = -12;


state = PlayerState.FREE;

enum PlayerState
{
	FREE,
	JUMP,
	HURT,
	DEAD,
	ATTACK,
	RUNNING
}