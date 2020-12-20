if !(StateManager.currentState == states.powerup)
{
	with (oPlayer)
	{
		hp -= 1;
		sprite_index = sGotHurt;
		gotHurt = true;
	}
}
else
{
	show_debug_message("Player did not take damage.");	
}

instance_destroy(self);

//if (!oPlayer.playerPressedParry)
//{
//		with (StateManager)
//	{
//		currentState = states.dead;	
//	}
//}
//else
//{
//	oPlayer.parrySuccess = true;
//}

//instance_destroy(self);