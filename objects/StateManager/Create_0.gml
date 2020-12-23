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

comboThreshold = 2;
currentComboCount = 0;

currentState = states.preGame;

triggered = false;
triggeredDeath = false;
triggeredDeath2 = false;

timeSinceBegun = 0;

preGameGravity = 0.40;

closeToStageChange = false;
criticalStageChangeV = 800;

topSpeed = 0;
savedSpd = false;

if (!audio_is_playing(sndStage1n2))
{
	audio_stop_all();
	audio_play_sound(sndStage1n2,1,1);
}

playedMusic = false;
playedLastMusic = false;