enum states 
{
	preGame,
	normal,
	powerup,
	slowMotion,
	dead,
	almostDead,
	winningState
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

spawningActive = false;

comboThreshold = 10;
currentComboCount = 0;

currentState = states.preGame;

triggered = false;
triggeredDeath = false;

timeSinceBegun = 0;

preGameGravity = 0.40;

closeToStageChange = false;
criticalStageChangeV = 0;