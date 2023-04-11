/// @description Insert description here
spd = 2;
xspd = 0;
yspd = 0;
distance = 300;
enemy_gravity = .5;
life = 20;
image_xscale = .5;
image_yscale = image_xscale;

state = EnemyState.FREE;

enum EnemyState{
	FREE,
	CHASE,
	ATTACK,
}
