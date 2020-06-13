
#define DEV_PREP(var1) TRIPLES(ADDON,fnc,var1) = { call compile preProcessFileLineNumbers '\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT_F\functions\DOUBLES(fnc,var1).sqf' }
//amp_slingload_fnc_adjustRigging = {call compile preProcessFileLineNumbers '\z\amp\addons\slingload\functions\fnc_adjustRigging.sqf'}

PREP(adjustRigging);
PREP(attachCargo);
PREP(attachCargoLocal);
PREP(canAttachCargo);
PREP(canAdjustRigging);
PREP(cancelPlacement);
PREP(canReleaseCargo);
PREP(canRemoveRigging);
PREP(canRigCargo);
PREP(canRigCargoManual);
PREP(getCargoLiftPoints);
PREP(handleScrollWheel);
PREP(pickUpFitting);
PREP(releaseCargo);
PREP(removeRigging);
PREP(rigCargo);
PREP(rigCargoManual);
