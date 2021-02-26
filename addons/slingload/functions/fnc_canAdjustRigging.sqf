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
 * Exslrle:
 * [_cargo, _unit] call slr_slingload_fnc_canAdjustRigging
 * [cursorObject, player] call slr_slingload_fnc_canAdjustRigging
 */

params ["_cargo", "_player"];

!GVAR(pfeh_running) && {
    (!isNull ropeAttachedTo _cargo || {
        !((_cargo getVariable ["slr_slingload_ropes4Cargo", []]) isEqualTo [])
    })
}
