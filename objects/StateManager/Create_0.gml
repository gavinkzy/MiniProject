enum states 
{
	normal,
	powerup,
	slowMotion,
	dead
}

enum stages
{
	one,
	two,
	three,
	four
}

currentStage = stages.one;

scoreSpdMultiplier = 0.006;

//for slowmo
spdMultiplier = 1;

//obstacles
vspSet = -1;
hspSet = 0;
distanceMoved = 0;

spawningActive = true;

comboThreshold = 10;
currentComboCount = 0;

currentState = states.normal;

triggered = false;

timeSinceBegun = 0;