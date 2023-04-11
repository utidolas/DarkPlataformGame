// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_state_free(){	
xspd *= spd;
yspd += enemy_gravity;

if (xspd != 0) {image_xscale = sign(xspd)};


if (place_meeting(x + xspd, y, obj_wall)) {
	xspd = 0;
}

x += xspd;

if (place_meeting(x, y + yspd, obj_wall)) {
	yspd = 0;
}

y += yspd;

if(distance_to_object(obj_player) < distance){
	state = EnemyState.CHASE;
}

}
	
function enemy_state_chase(){


if (place_meeting(x + xspd, y, obj_wall)) {
	xspd = 0;
}

x += xspd;

if (place_meeting(x, y + yspd, obj_wall)) {
	yspd = 0;
}

y += yspd;


vir = sign(obj_player.x - x);
xspd = vir * .8;
	
if(sprite_index != spr_enemy_yurei_walkingr and vir > 0){
	sprite_index = spr_enemy_yurei_walkingr;
}else if (sprite_index != spr_enemy_yurei_walkingl and vir < 0){
	sprite_index = spr_enemy_yurei_walkingl;
}

}
	
function enemy_state_attack(){

}
