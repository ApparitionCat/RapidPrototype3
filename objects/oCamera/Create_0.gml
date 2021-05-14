camera = camera_create();

x = clamp(x, 1000/2, room_width-(1050/2));
y = clamp(y, 750/2, room_height-(780/2));

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(1000,750,1,10000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

follow = oPlayer;
xTo = x;
yTo = y;