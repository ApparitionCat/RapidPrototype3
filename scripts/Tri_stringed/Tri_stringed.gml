///Tri_stringed(bullet, angle)
function Tri_stringed(argument0, argument1) {

	//this code will shoot a string of 3 bullets with varying speeds
	//KEEP IN MIND THAT THE ANGLE IS TOWARDS THE PLAYER IF 0, SO STARTING ANGLE SHOULD BE NEGATIVE
	//UNLESS YOU ONLY WANT TO SHOOT ONE STRING
	//THE ANGLE HAS TO BE INCREASED OUSIDE OF THIS FUNCTION

	var bullet = argument0;
	var angle = argument1;

		for(i = 0; i <= 2; i++){
		var proj = instance_create_layer(x,y,"Instances", bullet);
		proj.speed = spd*1.75;
		if(i = 1){proj.speed = spd*2; proj.mrk = i}
		if(i = 2){proj.speed = spd*2.50; proj.mrk = i}
		proj.direction = point_direction(x,y,oPlayer.x,oPlayer.y) + angle;
		}

}
