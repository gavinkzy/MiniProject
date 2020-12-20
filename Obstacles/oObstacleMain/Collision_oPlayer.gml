if (!oPlayer.playerPressedParry)
{
		with (StateManager)
	{
		currentState = states.dead;	
	}
}
else
{
	oPlayer.parrySuccess = true;
}

instance_destroy(self);