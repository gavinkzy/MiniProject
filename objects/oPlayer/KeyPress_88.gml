/// @description Parry Skill
if (StateManager.currentState != states.almostDead) && (StateManager.currentState != states.preGame)
{
	playerPressedParry = true;
	sprite_index = sParry;
	gotHurt = false;
}