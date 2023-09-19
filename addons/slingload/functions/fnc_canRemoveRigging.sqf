#include "script_component.hpp"
/*
 * Author: Ampersand
 * check if unit can remove cargo rigging
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Example:
 * [_cargo, _unit] call slr_slingload_fnc_canRemoveRigging
 */
//slr_slingload_fnc_canRigCargo = {
params ["_cargo", "_player"];

if !([_unit, _cargo, []] call ace_common_fnc_canInteractWith) exitWith {false};

!isNull ropeAttachedTo _cargo || {
    !((_cargo getVariable ["slr_slingload_ropes4Cargo", []]) isEqualTo [])
}
|| {!isNull (_cargo getVariable [QGVAR(wreckDummy), objNull])}
