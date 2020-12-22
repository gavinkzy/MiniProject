/// @description Parry Skill
if (StateManager.currentState != states.almostDead)
{
	playerPressedParry = true;
	sprite_index = sParry;
	gotHurt = false;
}