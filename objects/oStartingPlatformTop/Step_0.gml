if (bbox_bottom < 0)
{
	instance_destroy(self);
}
if (StateManager.currentState != states.preGame)
{
	vsp = -1;
	hsp = -2;
	image_alpha -= 0.001;
}

x = x + hsp;
y = y + vsp;