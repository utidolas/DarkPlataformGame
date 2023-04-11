// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function reset_animation(sprite_name){
	if image_index > sprite_get_number(sprite_name) {
    image_index = 0;
    image_speed = 1;
}

}