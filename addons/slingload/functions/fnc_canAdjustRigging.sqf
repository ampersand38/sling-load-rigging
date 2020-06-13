#include "script_component.hpp"
/*
 * Author: Ampersand
 * check if unit can adjust cargo rigging
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Example:
 * [_cargo, _unit] call amp_slingload_fnc_canAdjustRigging
 * [cursorObject, player] call amp_slingload_fnc_canAdjustRigging
 */

params ["_cargo", "_player"];

!amp_slingload_pfeh_running && {
    (!isNull ropeAttachedTo _cargo || {
        !((_cargo getVariable ["amp_slingload_ropes4Cargo", []]) isEqualTo [])
    })
}
