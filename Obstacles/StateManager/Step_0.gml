switch currentState
{
	default:
	break;
	case states.normal:
		with (oPlayer)
		{
			if (!playerPressedParry) && (!parrySuccess) sprite_index = sFalling;	
		}
		break;
	case states.powerup:
		break;
	case states.slowMotion:
		with (oPlayer)
		{
			if (!playerPressedParry) && (!parrySuccess) sprite_index = sFalling;	
		}
		break;
	case states.dead:
		game_restart();
		break;
}