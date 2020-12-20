if (sprite_index == sParry)
{
	playerPressedParry = false;
	if (parrySuccess)
	{
		sprite_index = sPower;
	}
}

else if (sprite_index == sPower)
{
	parrySuccess = false;
}

if (sprite_index == sGotHurt)
{
	gotHurt = false;
}