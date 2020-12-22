if (bbox_bottom < 0)
{
	StateManager.currentState = states.dead;
	instance_destroy(self);
}

vsp = StateManager.vspSet;
hsp = StateManager.hspSet;

x = x + hsp;
y = y + vsp;