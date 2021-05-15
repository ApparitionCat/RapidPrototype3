///Tri_midfast(bullet)
function Tri_midfast(argument0) {

	var bullet = argument0;

	var tempAngle = -30;
		for(i = 0; i <= 2; i++){
		var proj = instance_create_layer(x,y,"Instances", bullet);
		proj.speed = spd*2*1;
		if(i != 1){proj.speed = spd*1.8*1}
		proj.direction = point_direction(x,y,oPlayer.x,oPlayer.y) + tempAngle;
		tempAngle += 30;
		}




}
