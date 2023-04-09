/// @description Insert description here
spd = 2;
xspd = 0;
yspd = 0;
dir = 0;
player_gravity = .5;
life = 100;

state = PlayerState.FREE;

enum PlayerState
{
	FREE,
	JUMP,
	HURT,
	DEAD
}