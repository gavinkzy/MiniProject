if (!oPlayer.playerPressedParry) && (StateManager.currentState != states.powerup)
{
	with (oPlayer)
	{
		hp -= 1;
		sprite_index = sGotHurt;
		gotHurt = true;
	}
	instance_destroy(self);
}
else
{
	oPlayer.parrySuccess = true;
	show_debug_message("Player parried successfully.");
	StateManager.currentComboCount += 1;
	var choice = irandom_range(1,2);
	switch choice
	{
		case 1:
			//grant hp
			with (oPlayer)
			{
				if (hp < maxhp)
				{
					hp += 1;	
				}
			}
			show_debug_message("Gained HP.");
			break;
		case 2:
			//grant slowmo ability
			show_debug_message("Gained slowmo ability.");
			break;
	}
}

instance_destroy(self);