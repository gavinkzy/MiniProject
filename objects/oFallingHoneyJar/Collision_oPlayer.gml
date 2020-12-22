playerTouchedHoneyJar = true;
if (instance_exists(oBreakableTile)) instance_destroy(oBreakableTile);
if (instance_exists(oNonParryable)) instance_destroy(oNonParryable);
if (instance_exists(oParryable)) instance_destroy(oParryable);
if (instance_exists(oPlatform)) instance_destroy(oPlatform);