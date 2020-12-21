if !(StateManager.currentState == states.powerup)
{
	StateManager.currentState = states.dead;
	with (oPlayer)
	{
		vsp = -1;
		hsp = 1;
	}
}
else
{
	show_debug_message("Player did not take damage.");	
}