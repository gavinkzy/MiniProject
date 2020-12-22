vsp = StateManager.vspSet;
if (StateManager.currentStage == stages.one) hsp = random_range(-3,3);
if (StateManager.currentStage == stages.two) hsp = random_range(-2,2);
if (StateManager.currentStage == stages.three) hsp = random_range(-1,1);
if (StateManager.currentStage == stages.four) hsp = random_range(-1,1);
vspMultiplier = 1;
hspMultiplier = 1;
rotateAmount = random_range(-1,1);