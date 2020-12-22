if (bbox_bottom < 0)
{
	instance_destroy(self);
}
if (StateManager.currentState != states.preGame)
{
	vsp = StateManager.vspSet;
	hsp = StateManager.hspSet;
}

x = x + hsp;
y = y + vsp;