if (bbox_right < 0)
{
	layer_hspeed("Backgrounds_1", 0);
}

if (bbox_bottom < 0) || (bbox_top > room_height)
{
	layer_hspeed("Backgrounds_1", 0);
	instance_destroy(self);
}

vsp = vsp + grv;

if (StateManager.currentState != states.preGame)
{
	grv = 0.001;
	hsp = -2;
	image_alpha -= 0.01;
	image_angle -= 1;
}

x = x + hsp;
y = y + vsp;