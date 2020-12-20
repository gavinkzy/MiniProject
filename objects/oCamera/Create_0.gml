/// @description Set Up Camera
cam = view_camera[0]
follow = oPlayer;
view_w_half = camera_get_view_width(cam) / 2; //returns width of camera
view_h_half = camera_get_view_height(cam) / 2; //returns height of camera
xTo = xstart; //original x pos upon creation of instance
yTo = ystart; //original y pos upon creation of instance

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;