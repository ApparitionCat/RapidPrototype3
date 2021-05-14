
//i have no idea what these do but it works


x += (xTo - x)/5
y += (yTo - y)/5

if(follow != noone){
	xTo = follow.x
	yTo = follow.y
}

x = clamp(x, 1000/2, room_width-(1050/2));  //what i know is that these clamp restricts values between output
y = clamp(y, 750/2, room_height-(780/2));   //these values are then used in the vm variable
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);