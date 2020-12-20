enum states 
{
	normal,
	powerup,
	slowMotion
}

enum stages
{
	one,
	two,
	three
}

currentStage = stages.one;

//for slowmo
spdMultiplier = 1;

//obstacles
hspAmount = 0;
vspAmount = 0;

comboThreshold = 10;
currentComboCount = 0;

currentState = states.normal;

triggered = false;