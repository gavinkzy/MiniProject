if (bbox_bottom < 0)
{
	instance_destroy(self);
}
if (StateManager.currentState != states.preGame)
{
	vsp = StateManager.vspSet;
	hsp = -2;
}

x = x + hsp;
y = y + vsp;